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
find / -name '*postgresql.conf*' -o -name *pg_hba.conf* 2> /dev/null


vi /var/lib/pgsql/12/data/postgresql.conf
# /listen_addresses
# #listen_addresses = 'localhost' 
# listen_addresses = '*' 
/usr/pgsql-12/bin/postgres restart

vi /var/lib/pgsql/12/data/pg_hba.conf
# /IPv4 local connections
# host    all             all             127.0.0.1/32            ident
# host    all             all             0.0.0.0/0            md5


systemctl restart postgresql-12
systemctl status postgresql-12

netstat -ntlp

# 방화벽 설정
systemctl status firewalld
firewall-cmd --list-all-zone
firewall-cmd --get-default-zone
firewall-cmd --zone=public --list-all
firewall-cmd --zone=public --add-port=5432/tcp
# firewall-cmd --zone=public --remove-port=22581/tcp

sudo firewall-cmd --permanent --add-port=5432/tcp
#출처: https://uxgjs.tistory.com/162 [UX 공작소]

sudo systemctl restart firewalld


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


su -
mkdir /data
chmod go+w /data
wget https://sp.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip -O /data/dvdrental.zip
unzip /data/dvdrental.zip -d /data

sudo -u postgres -i
pg_restore -U postgres -d dvdrental /data/dvdrental.tar




