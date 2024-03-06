import io
import argparse
import datetime
import psycopg2
import pandas
import os
import requests
import gzip
import hashlib
import time
import queue
import threading
import tarfile


def worker(od, skp, e, q, t):
    print ("{0} thread waiting to start".format(datetime.datetime.now()))
    e.wait(timeout = 120)
    while True:
        try:
            url, md5 = q.get_nowait()
            print ("{0} trying {1}".format(datetime.datetime.now(), url))
            resp = requests.get('https://' + url)
            if resp.status_code != 200:
                print ("{0} EE {1} {2}".format(datetime.datetime.now(), url, resp.status_code))
                time.sleep(1)
                q.put_nowait((url, md5))
                continue
            md5_ = hashlib.md5(resp.content).hexdigest()
            if md5 != md5_:
                print ("{0} EE md5 mismatch {1} md5: {2} {3}".format(datetime.datetime.now(), url, md5, md5_))
                if not skp:
                    continue
            if url.endswith('.gz'):
                t.put_nowait((os.path.join(od, url.split('/')[-1]), resp.content))
            else:
                t.put_nowait((os.path.join(od, url.split('/')[-1]) + '.gz', gzip.compress(resp.content)))
        except queue.Empty:
            break
        except Exception as e:
            print ("{0} EE worker oops: {1}".format(datetime.datetime.now(), e))

def worker_tar(od, S, e, q):
    n = 1
    left = S
    fn = os.path.join(od, f'batch-{n}.tar.gz')
    t = tarfile.open(fn, 'w:gz')
    print ("{0} tar to write {1}".format(datetime.datetime.now(), fn))
    while not e.is_set():
        try:
            fn, data = q.get(timeout = 5)
            ti = tarfile.TarInfo(fn)
            ti.size = len(data)
            buf = io.BytesIO()
            buf.write(data)
            buf.seek(0)
            t.addfile(ti, buf)
            buf.close()
            left -= 1
            if left < 1:
                left = S
                t.close()
                n += 1
                fn = os.path.join(od, f'batch-{n}.tar.gz')
                t = tarfile.open(fn, 'w:gz')
                print ("{0} tar to write {1}".format(datetime.datetime.now(), fn))
        except queue.Empty:
            print ("{0} WW tar queue is empty".format(datetime.datetime.now()))
    t.close()
    print ("{0} finished".format(datetime.datetime.now()))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input", action = "store", required = True,
                    help = "input file containing analysis and corresponding urls")
    parser.add_argument("-o", "--output", action = "store",
                    help = "folder to store downloaded files", default = '/tmp')
    parser.add_argument("-w", "--workers", action = "store", type = int,
                    help = "how many download workers to start", default = 5)
    parser.add_argument("-H", "--server", action = "store",
                    help="database server name/ip address", default = os.getenv('DB_HOST'))
    parser.add_argument("-P", "--port", action = "store",
                     help = "database server port", default = os.getenv('DB_PORT', 5432))
    parser.add_argument("-D", "--database", action = "store",
                     help = "database name", default = os.getenv('DB', 'coveo'))
    parser.add_argument("-S", "--schema", action = "store",
                     help = "schema name", default = os.getenv('DB_SCHEMA', 'ebi'))
    parser.add_argument("-u", "--user", action = "store",
                     help = "database user", default = os.getenv('SECRET_USERNAME'))
    parser.add_argument("-p", "--password", action = "store",
                     help = "database password", default = os.getenv('SECRET_PASSWORD'))
    parser.add_argument("-r", "--runid_table_name", action = "store",
                     help = "the ena run_id map table", default = 'runid')
    parser.add_argument("-R", "--runid_ok_table_name", action = "store",
                     help = "the table of okay runids", default = 'runid_ok')
    parser.add_argument("-b", "--batch_size", action = "store", type = int,
                     help = "the table of okay runids", default = 10000)
    parser.add_argument("-M", "--skip_md5", action = "store_true", 
                     help = "do not bother with the md5 hash")
    args = parser.parse_args()

    conn = psycopg2.connect(
        dbname = args.database,
        host = args.server,
        port = args.port,
        user = args.user,
        password = args.password,
        application_name = f'downloader run by {args.user}',
    )
    print ("{0} connected to db engine to use db {1}".format(datetime.datetime.now(), args.database))

    known = set(pandas.read_sql(f"""
select r.ena_run
  from {args.schema}.{args.runid_table_name} r
  join {args.schema}.{args.runid_ok_table_name} ro
  on r.id = ro.runid
    """, con = conn)['ena_run'])
    print ("{0} # {1} known items".format(datetime.datetime.now(), len(known)))
    conn.close()

    u = pandas.read_csv(args.input, sep = '\t')

    print ("{0} loaded file {1} # {2} samples".format(datetime.datetime.now(), args.input, u.shape[0]))
    E = threading.Event()
    Et = threading.Event()
    Q = queue.Queue()
    TAR = queue.Queue()
    threads = list()
    for i in range(args.workers):
        t = threading.Thread(target = worker, args = (args.output, args.skip_md5, E, Q, TAR))
        threads.append(t)
        t.start()
    tt = threading.Thread(target = worker_tar, args = (args.output, args.batch_size, Et, TAR))
    tt.start()
    for i, r in u[['run_accession', 'submitted_ftp', 'submitted_md5']].iterrows():
        if r['run_accession'] in known:
            continue
        for url, md5 in zip(r['submitted_ftp'].split(';'), r['submitted_md5'].split(';')):
            if ('annot' in url) or ('coverage' in url):
                Q.put_nowait((url, md5))
    print ("{0} thread block removal".format(datetime.datetime.now()))
    E.set()
    for t in threads:
        t.join()
    print ("{0} download threads exited".format(datetime.datetime.now()))
    Et.set()
    tt.join()


