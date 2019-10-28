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


