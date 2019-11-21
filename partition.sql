-- 파티션 정보 조회
select
 schema_name ,
Table_owner
 Table_name ,
 Partition_name,
 Backing_table,
 High_value,
 Partition_position
From all_tab_partition
Where table_name in (
)
Order by Table_name , Partition_position ;

-- 파티션 추가
Alter table test.test_table
 add partition pt_0001
 value less than ('1234');

-- 파티션 이름 변경, 둘다 실행해야함.
Alter table test.test_table_pt1234 
 rename to test_table_pt5678 ;
Alter table test.test_table 
 Rename partition pt1234 to pt5678 ;


-- 파티션 마지막 파티션만 조회
psql -P paper=off -d testdb -u test -p 5444 -c "
set datestyle to ISO;
"
Select a.table_name
,      a.partition_name
,      a.high_value
,      a.partition_position
from   all_tab_partition   a
,(     
       select table_name
       ,      max(high_value)
       ,      max(partition_position)
       from   all_tab_partition
       where  1=1
       and    table_onwer=''
       and    schema_name=''
       group by 1
       order by 1,3
)      b
where  1=1
and    a.table_owner=''
and    a.schema_name=''
and    a.table_name=b.table_name
and    a.high_value=b.high_value
and    a.partition_position=b.partition_position
order by 1,2
