튜플만 출력
psql -d 데이터베이스 -U 유저 -p 포트 -h 아이피 -tc "
select '테스트'
"


select version ();
select version () \gx

-- 트랜젝션 용량 설정값
show max_wal_size;
show min_wal_size;

-- 암호 변경
alter user postgres with password 'postgres';

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


select ctid,xmin,xmax,* from t limit 100;

select * from pg_class where  relname ='t' \gx

-- 테이블 나이
select age(relfrozenxid) from pg_class where  relname ='t' \gx


show autovacuum_freeze_max_age;
show vacuum_freeze_table_age;
show vacuum_freeze_min_age;


\d pg_database;
select * from pg_database;
select * from pg_stat_database \gx
select age(datfrozenxid) from pg_database;

vacuum freeze;




-- Table: test.test_hash

-- DROP TABLE test.test_hash;

-- 파티션 마스터 테이블 생성
CREATE TABLE test.test_hash
(
    i integer NOT NULL ,
    t timestamp with time zone,
    CONSTRAINT test_hash_pkey PRIMARY KEY (i)
) partition by hash (i);

--ALTER TABLE test.test_hash    OWNER to postgres;

CREATE TABLE test.test_hash_p1 PARTITION OF test.test_hash    FOR VALUES WITH (MODULUS 4, REMAINDER 0);
CREATE TABLE test.test_hash_p2 PARTITION OF test.test_hash    FOR VALUES WITH (MODULUS 4, REMAINDER 1);
CREATE TABLE test.test_hash_p3 PARTITION OF test.test_hash    FOR VALUES WITH (MODULUS 4, REMAINDER 2);
CREATE TABLE test.test_hash_p4 PARTITION OF test.test_hash    FOR VALUES WITH (MODULUS 4, REMAINDER 3);

insert into test.test_hash select generate_series(1,100),current_timestamp;

-- 데이터 베이스 목록
\l

-- 다른 데이터 베이스 접속
\c

-- 데이터베이스 생성
CREATE DATABASE test;

-- Look 의 원인 PID 찿기
\df pg_blocking_pids
select pg_blocking_pids(pid);

-- 강제 종료
\df pg_terminate_backend
select pg_terminate_backend(pid);

-- 쿼리 실행 목록
 select * from pg_catalog.pg_stat_activity



-- 세션에만 적용되는 날자 출력형식 변경
Set datestyle to ISO;









\c 
