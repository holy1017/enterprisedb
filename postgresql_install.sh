# CentOS Linux release 8.2.2004 (Core)
cat /etc/redhat-release

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

ls -l /var/lib/pgsql/12

# 제거
# /usr/pgsql-12/bin/dropdb mydb







