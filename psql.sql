select version ();
select version () \gx

-- 트랜젝션 용량 설정값
show max_wal_size;
show min_wal_size;


create table t (a int);
insert into t values (1);

-- 용량
\dt+

\dt

-- 칼럼 내용
\d t

-- 명령어 찿기
\df pg_ba*

select generate_series(1,10);
insert into t select generate_series(1,10000000);
\dt+
update t set a = floor(random()*100);

truncate table t;

select * from pg_stat_activity 
where pid=29114 \gx


select pg_backend_pid();

select count(*) from pg_settings;
select count(*),context from pg_settings group by context ;

show lc_messages;

\dnS

-- 환경변수. 쿼리 실행시 기본 스키마 확인
show search_path;

select current_time

-- database 전체
alter database 데이터베이스명 환경 변수 = 값;

-- 해당 사용자
alter user 유저명 환경 변수 = 값

-- 세션
set 환경 변수 = 값;   
set search_path = test; -- 기본 스키마 설정.  

-- http://postgresql.kr/docs/11/maintenance.html

\h vacuum

vacuum analyze pg_class;
\d pg_class

\dt+ pg_attribute
\d pg_attribute

-- 에디터
\e 

select attrelid,attname
from pg_attribute
where attrelid=1
and attname='test';

vacuum analyze  t;

select *
from pg_attribute
where attrelid=1
and attname='test';


\d pg_stats
select * from pg_stats where  tablename ='t' \gx

-- vacuum 작업 정보
\d pg_stat_all_tables
select * from pg_stat_all_tables where  relname ='t' \gx

-- 작업전 보기
select * from pg_stats where  tablename ='t' \gx
-- 데이터 변경
update t set a = floor(random()*10);
-- 작업후 보기
select * from pg_stats where  tablename ='t' \gx
-- 재정렬
vacuum analyze  t;
-- 작업후 보기
select * from pg_stats where  tablename ='t' \gx


