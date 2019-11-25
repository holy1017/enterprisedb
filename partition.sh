-- 파티션 마지막 파티션만 조회
psql -P paper=off -d testdb -u test -p 5444 -c "

set datestyle to ISO;

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
" grep ￦| | sed -n '2,$ s/[-:'\'' ]//gp' | awk -F\| "
{
 tm1=substr(\$3,1,4)
 tm2=substr(\$3,5,2)
 tm3=substr(\$3,7,2)
tm4=substr(\$3,9,2) 
tm5=substr(\$3,11,2)
tm6=substr(\$3,13,2)
tm=(mktime(sprintf(\"%d %d %d %d %d %d\",tm1,tm2,tm3,tm4,tm5,tm6))-systime())/60/60/24
print \$1\"\t\"tm > \"test.dat\"
print tm > \"test-\" \$1 \".cnt\"
}
"
