-- 파티션 포함 테이블별 건수 및 합계
SELECT *
from (
SELECT c.oid AS relid, --
  n.nspname AS schemaname, --스키마
  c.relname, -- 테이블
  pg_stat_get_live_tuples(c.oid) AS n_live_tup, -- 건수
upper(coalesce( p.table_name, c.relname)), -- 파티션
sum(pg_stat_get_live_tuples(c.oid) ) over (partition by upper(coalesce( p.table_name, c.relname))) as all_cnt -- 파티션 포함 건수
FROM pg_class c
   LEFT JOIN pg_index i ON c.oid = i.indrelid
  LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  LEFT JOIN all_tab_partitions p ON c.oid = p.backing_table
WHERE c.relkind = ANY (ARRAY['r'::"char", 'm'::"char"])
and n.nspace = 'tomas'
GROUP BY c.oid, n.nspname, c.relname, p.table_name
)
WHERE all_cnt > 1000000
order by relname
