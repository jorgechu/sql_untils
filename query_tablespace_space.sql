    select table_name, b.tablespace_name,sum( bytes)/1024/1024 "SIZE IN MB"
   from USER_segments a,user_tables b
  where  table_name=segment_name 
  and b.tablespace_name = 'BI_JUS_USR_ODI_DAT'
group by segment_name,b.tablespace_name,table_name;



--para tablas particionadas
    select table_name, b.tablespace_name,sum( bytes)/1024/1024 "SIZE IN MB"
   from USER_segments a,user_tables b
  where 1=1
  and table_name=segment_name 
  and b.tablespace_name is null
group by segment_name,b.tablespace_name,table_name;


    
    select table_name, b.tablespace_name,sum( bytes)/1024/1024/1024 "SIZE IN ¿MB?"
   from USER_segments a,all_tab_partitions b
  where 1=1
  --and table_name=segment_name 
  and b.tablespace_name = 'BI_JUS_RRHH_ODS_DAT'
group by b.tablespace_name,table_name;


-- ver ocupaciones indices particionadas
select round(sum(bytes)/1024/1024) Table_Allocation_MB, TABLESPACE_NAME
from user_segments
where segment_type in ('INDEX PARTITION')
group by TABLESPACE_NAME;

-- ver ocupaciones indices particionadas
select sum(bytes)/1024/1024 Table_Allocation_MB, TABLESPACE_NAME
from user_segments
where segment_type in ('INDEX PARTITION')
group by TABLESPACE_NAME;
