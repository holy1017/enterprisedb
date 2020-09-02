# CentOS Linux release 8.2.2004 (Core)
cat /etc/redhat-release

# 저 아래로 가서 시작. 가운데는 다 실패함. 공식사이트 설치 가이드 참조
#---------------

# 업데이트
yum update -y

# 검색
yum search postgresql-10
yum list postgresql

# 내장 기본버전으로 설치
sudo yum install -y postgresql

# 새버전으로 할경우
# sudo rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# -U(--upgrade) : 패키지를 업그레이드한다.
# -v : 자세한 정보를 출력한다.
# -h : 설치 진행 상황을 # 문자를 이용하여 출력한다.
sudo yum install -y postgresql11-server postgresql11-contrib
yum install postgresql10-server.x86_64 postgresql10

# dnlcl 확인 먼저
ls -l /usr/psql*
ls -l /usr/bin/psql
find / -name '*psql*' -o -name '*postgresql*'

# 위에 순서 개판됨
# 사용자 계정으로 할것
sudo yum install https://download.postgresql.org/pub/repos/yum/srpms/12/redhat/rhel-8.2-x86_64/pgdg-redhat-repo-42.0-11.src.rpm

rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

ls -l -a  /etc/yum.repos.d/

yum install postgresql96-server postgresql96

yum install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
yum install postgresql96


#--------------------------------------
# 게속 실패해서 공식 사이트 명령어 참조
# 루트

# Install the repository RPM:
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable the built-in PostgreSQL module:
dnf -qy module disable postgresql

# Install PostgreSQL:
dnf install -y postgresql12-server

# Optionally initialize the database and enable automatic start:
/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable postgresql-12
systemctl start postgresql-12

# 여기까지 아주 잘됨
find / -name '*psql*' -o -name '*postgresql*'

# 사용자 계정
sudo -u postgres -i
ls -l /home

# root 계정은 롤 없어서 실패
/usr/pgsql-12/bin/psql

# exit

# 생성
/usr/pgsql-12/bin/createdb mydb

# 제거
# /usr/pgsql-12/bin/dropdb mydb







