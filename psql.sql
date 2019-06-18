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

\d t

-- 명령어 찿기
\df pg_ba*

select generate_series(1,10);
insert into t select generate_series(1,10000000);
\dt+
update t set a = a+1;

truncate table t;

select * from pg_stat_activity 
where pid=29114 \gx


select pg_backend_pid();