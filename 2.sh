# su - postgres
$ echo $PGDATA
$ ps x
$ pg_ctl start
$ cd /postgres/11
$ ls
$ cd bin
# ehdna
$ find . -type f -exec sh -c "{} --help | head -1" \;
$ cd $PGDATA
$ ls *.conf
$ ls -l | grep ^d
$ cd base && ls

합계 36
drwx------ 2 postgres postgres 8192  6월 17 22:50 1
drwx------ 2 postgres postgres 8192  6월 17 22:50 13880
drwx------ 2 postgres postgres 8192  6월 17 23:13 13881

# 데이터 베이스 생성
$ psql -c "CREATE DATABASE test" && ls

# 최적화
$ vacuumdb postgres
$ cd 13878 && ls
$ cd ..
$ createdb test && ls
$ pgbench --help
$ pgbench -i test
$ pgbench -j 10 -c 10 -T 600 test
$ Ctrl-Z
$ bg
$ ps x
$ cd $PGDATA/base && ls
$ cd 16384
$ while true; do ls -ltr ; sleep 1 ; done
$ top -d 1 -c -i
$ cd /pg_wal/pg11 && ls -l
