# psql mydb

SELECT version();

SELECT current_date;

SELECT 2 + 2;

--도움말
\h

--나가기
\q

정보보기
  (옵션: S = 시스템 개체 표시, + = 추가 상세 정보)
  \d[S+]                 테이블, 뷰 및 시퀀스 목록
  \d[S+]  NAME           테이블, 뷰, 시퀀스 또는 인덱스 설명
  \da[S]  [PATTERN]      집계 함수 목록
  \dA[+]  [PATTERN]      접근 방법 목록
  \db[+]  [PATTERN]      테이블스페이스 목록
  \dc[S+] [PATTERN]      문자셋 변환자 목록
  \dC[+]  [PATTERN]      자료형 변환자 목록
  \dd[S]  [PATTERN]      다른 곳에서는 볼 수 없는 객체 설명을 보여줌
  \dD[S+] [PATTERN]      도메인 목록
  \ddp    [PATTERN]      기본 접근권한 목록
  \dE[S+] [PATTERN]      외부 테이블 목록
  \det[+] [PATTERN]      외부 테이블 목록
  \des[+] [PATTERN]      외부 서버 목록
  \deu[+] [PATTERN]      사용자 매핑 목록
  \dew[+] [PATTERN]      외부 데이터 래퍼 목록
  \df[anptw][S+] [PATRN] [agg/normal/procedures/trigger/window] 함수 목록
  \dF[+]  [PATTERN]      텍스트 검색 구성 목록
  \dFd[+] [PATTERN]      텍스트 검색 사전 목록
  \dFp[+] [PATTERN]      텍스트 검색 파서 목록
  \dFt[+] [PATTERN]      텍스트 검색 템플릿 목록
  \dg[S+] [PATTERN]      롤 목록
  \di[S+] [PATTERN]      인덱스 목록
  \dl                    큰 개체 목록, \lo_list 명령과 같음
  \dL[S+] [PATTERN]      프로시져 언어 목록
  \dm[S+] [PATTERN]      materialized 뷰 목록
  \dn[S+] [PATTERN]      스키마 목록
  \do[S]  [PATTERN]      연산자 목록
  \dO[S+] [PATTERN]      collation 목록
  \dp     [PATTERN]      테이블, 뷰 및 시퀀스 액세스 권한 목록
  \dP[itn+] [PATTERN]    파티션 릴레이션 목록 [인덱스/테이블만] [n=nested]
  \drds [PATRN1 [PATRN2]] 데이터베이스별 롤 설정 목록
  \dRp[+] [PATTERN]      복제 발행 목록
  \dRs[+] [PATTERN]      복제 구독 목록
  \ds[S+] [PATTERN]      시퀀스 목록
  \dt[S+] [PATTERN]      테이블 목록
  \dT[S+] [PATTERN]      데이터 형식 목록
  \du[S+] [PATTERN]      롤 목록
  \dv[S+] [PATTERN]      뷰 목록
  \dx[+]  [PATTERN]      확장 모듈 목록
  \dy     [PATTERN]      이벤트 트리거 목록
  \l[+]   [PATTERN]      데이터베이스 목록
  \sf[+]  함수이름       함수 정의 보기
  \sv[+] 뷰이름          뷰 정의 보기
  \z      [PATTERN]      \dp와 같음



select * from pg_user;
CREATE USER holy PASSWORD '';
-- # createuser holy
-- # dropuser name
                 
-- createdb dvdrental
select * from pg_database;
CREATE DATABASE holy OWNER holy;
-- 목록
\l
\c holy
-- drop DATABASE mydb;

\dn
CREATE SCHEMA holy;
drop SCHEMA holy;
CREATE SCHEMA holy AUTHORIZATION holy;

\c holy -user holy


GRANT group_role TO role1, ... ;
REVOKE group_role FROM role1, ... ;

GRANT ALL 
    ON ALL TABLES IN SCHEMA public
    TO  PUBLIC ;
                 
\! ls -l
\! pwd
\! find / -name *make* 2> /dev/null












