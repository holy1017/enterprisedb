
-- 파티션 제외 , 테이블별 용량
Select  table_name
,  pg_size_pretty( pg_relation_size(table_name))
From all_table
Where 1=1
And schema_name = ''
And table_name not in (
Select table_name
From all_part_table
Where 1=1
And schema_name = 
)
And table_name not in (
Select table_name||'_'||partition_name
From all_tab_partition
Where 1=1
And schema_name =
)
Order by 1
