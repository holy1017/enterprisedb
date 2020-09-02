# 업데이트
yum update -y

# 검색
yum search postgresql-10
yum list postgresql

# 내장 기본버전으로 설치
sudo yum install -y postgresql

# 새버전으로 할경우
sudo rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
# -U(--upgrade) : 패키지를 업그레이드한다.
# -v : 자세한 정보를 출력한다.
# -h : 설치 진행 상황을 # 문자를 이용하여 출력한다.
sudo yum install -y postgresql11-server postgresql11-contrib
yum install postgresql10-server.x86_64 postgresql10

# dnlcl 확인 먼저
ls -l /usr/psql*
ls -l /usr/bin/psql
find / -name '*psql*' -o -name '*postgresql*'

