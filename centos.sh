uname -a

lscpu

uptime

ip addr

127.0.0.1
192.168.204.128

# 접속자 확인
w

who

ps -ef
ps x
ps xl


# 
http://192.168.204.128/pgadmin4
postgres@localhost
postgres

cat /etc/passwd

useradd postgres
id postgres
su - postgres

cd /postgres/11

/postgres/11/bin/psql

# 시스템  경로 추가. 재로그인 필요
echo 'export PATH=/postgres/11/bin:$PATH' >> ~/.bash_profile
echo 'export PGDATA=/home/postgres/data:$PGDATA' >> ~/.bash_profile
echo $PATH
echo $PGDATA

# 환경변수
export PGDATA=/home/postgres/data
export LANG=ko_KR.UTF-8
export LC_COLLATE=C

# 초기화
initdb data
initdb data

# 시작
pg_ctl start -D data -l data.log

psql

postgres=# \l
                               데이터베이스 목록
   이름    |  소유주  | 인코딩 | Collate |    Ctype    |      액세스 권한
-----------+----------+--------+---------+-------------+-----------------------
 postgres  | postgres | UTF8   | C       | ko_KR.UTF-8 |
 template0 | postgres | UTF8   | C       | ko_KR.UTF-8 | =c/postgres          +
           |          |        |         |             | postgres=CTc/postgres
 template1 | postgres | UTF8   | C       | ko_KR.UTF-8 | =c/postgres          +
           |          |        |         |             | postgres=CTc/postgres
(3개 행)

# 정지
pg_ctl stop -D data

netstat -na | grep 5432

vi $PGDATA/postgresql.conf

#listen_addresses = 'localhost' 
#listen_addresses = '*' 

listen_addresses = '*'
shared_buffers = 512MB
work_mem = 64MB
maintenance_work_mem = 128MB
# 보통 on 처리
synchronous_commit = off
# 트랜젝션 용량 설정값
max_wal_size = 2GB
min_wal_size = 2GB
# 디스크 캐시 크기
effective_cache_size = 1GB
logging_collector = on
# millisecond
log_min_duration_statement = 200
track_io_timing = on


vi $PGDATA/pg_hba.conf

host    all             all             192.168.204.128/32               md5
# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            ident
# IPv6 local connections:
host    all             all             ::1/128                 trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust

host    all             all             0.0.0.0/0               md5

# 암호 변경
postgres=# ALTER USER postgres PASSWORD 'postgres';

# postgresql-korea/hands-on

pg_ctl start

pg_ctl reload

LANG=C date
LANG=JA_JP date
LANG=KO_KR date
date

locale

# 삭제
rm -rf data

# 도움말 일괄 출력
find /postgres/11/bin -type f -exec sh -c "{} --help | head -1" \;

# 지속 보기
watch ps x


true
echo $?
# 0

false
echo $?
# 1

free -m

#
dd if=/dev/zero of=1GB bs=256k count=4096

time cat 1GB > /dev/null


halt
poweroff
shutdown -h







