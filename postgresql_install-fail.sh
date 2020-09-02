
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
