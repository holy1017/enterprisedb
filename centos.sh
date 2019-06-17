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

# 시스템  경로 추가
echo 'export PATH=/postgres/11/bin:$PATH' >> ~/.bash_profile
echo $PATH

# 초기화
initdb data

# 시작
pg_ctl start -D data -l data.log

psql

# 정지
pg_ctl stop -D data

# 환경변수
export PGDATA=/home/postgres/data
pg_ctl start