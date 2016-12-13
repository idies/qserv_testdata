

set @dbname = 'qservTest_case01_mysql';
set @tablename = 'Object';

set @dbcount = 1


drop temporary table if exists t1;
create temporary table if not exists t1 (
	ordinal int not null auto_increment,
	dbname varchar(255),
	tablename varchar(255),
	primary key (ordinal)
);

insert t1 (dbname, tablename)
select table_schema, table_name
from information_schema.tables
where table_schema LIKE '%_mysql';

-- select * from t1;

set group_concat_max_len = 15000;




set @filename = concat('~/lsst-data/test/', substring_index(@dbname, '_', -2), '_', @tablename, '.dat');



select concat(
'select ', (
		select group_concat(case 
		when data_type like '%binary%' then concat('coalesce(hex(', column_name, '),\'\')')
		else concat('coalesce(',column_name,',\'\')')
		end
	order by ordinal_position)
	from information_schema.columns
where table_schema = @dbname and table_name = @tablename
order by group_concat(ordinal_position)
) ,
'  
into outfile '

, quote(@filename), 
								' fields terminated by \',\' ESCAPED BY \'\"\'
      						 LINES TERMINATED BY \'\\\\r\\\\n\'
  								 from ', @dbname, '.', @tablename,
								 ' limit 10'); 






/*
select concat('blah', (select column_name from information_schema.columns limit 1), ' blah2');
-- set @f = substring_index('qservTest_case01_mysql', '_', -2);
-- select @f ;

select concat('select ', @colstring, ' 
into outfile '

, quote(@filename), 
								' fields terminated by \',\' ESCAPED BY \'\"\'
      						 LINES TERMINATED BY \'\\\\r\\\\n\'
  								 from ', @dbname, '.', @tablename,
								 ' limit 10'); 


select group_concat(case 
		when data_type like '%binary%' then concat('coalesce(hex(', column_name, '),\'\')')
		else concat('coalesce(',column_name,',\'\')')
		end
	order by ordinal_position)
	from information_schema.columns
where table_schema = 'qservTest_case01_mysql' and table_name = 'Object'
order by group_concat(ordinal_position); 
*/









