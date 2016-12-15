CREATE DEFINER=`root`@`%` PROCEDURE `exportMysql2MSSQL`()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN


	declare dbcount int;
    declare ndbs int;
    declare dbname, tablename, filename, casenum varchar(255) default '';
    
    drop temporary table if exists t1;
	create temporary table if not exists t1 (
		ordinal int not null auto_increment,
		db_name varchar(255),
		table_name varchar(255),
		primary key (ordinal)
	);
	

	insert t1 (ordinal, db_name, table_name)
	select null, table_schema, table_name
	from information_schema.tables
	where table_schema LIKE '%_mysql';
    
    set group_concat_max_len = 15000;
    
    set dbcount = 1;
    
    select max(ordinal) into ndbs
    from t1;

    drop temporary table if exists resTab;
	  create temporary table resTab (
	  		id int auto_increment not null,
	  		caseNumber varchar(255),
	  		dbName varchar(255),
	  		tableName varchar(255),
	  		filename varchar(255),
	  		statement varchar(50000),
	  		primary key (id)
	  	);
	 
	     
    -- while dbcount <= 2 do 
   while dbcount <= ndbs do
		
        select db_name, table_name
        into dbname, tablename
        from t1
        where ordinal=dbcount;
      
		-- H:\GitHub\qserv_testdata\datasets\case01\mssql-fixed-data
		set casenum = substring_index(substring_index(dbname, '_', -2), '_', 1);

		set filename = concat('~/GitHub/qserv_testdata/datasets/', casenum, '/mssql-fixed-data/', tablename, '.dat');


        -- select * from t1;
        
        -- select dbname, tablename, filename;
        
        
		set @s =
		 concat(
		'select ', (
			select group_concat(
            case 
				when data_type like '%binary%' then concat('coalesce(hex(', column_name, '),\'\')')
				else concat('coalesce(',column_name,',\'\')')
			end
			order by ordinal_position)
			from information_schema.columns
			where table_schema = dbname and table_name = tablename
			order by group_concat(ordinal_position)
		) ,
		'  
		into outfile '

		, quote(filename), 
						' fields terminated by \',\' ESCAPED BY \'\"\'
						LINES TERMINATED BY \'\\\\r\\\\n\'
						from ', dbname, '.', tablename
		--				, ' limit 10'
						);        
        
    prepare stmt from @s;
	 execute stmt;
	 deallocate prepare stmt;  
	 
	 /*
	 caseNumber varchar(255),
	  		dbName varchar(255),
	  		tableName varchar(255),
	  		filename varchar(255),
	  		statement varchar(50000),*/
	 
	 insert resTab(caseNumber, dbName, tableName, filename, statement) VALUES
	 (casenum, dbname, tablename, filename, @s);
	 
	 
		
    set dbcount := dbcount + 1;    
		
	
    end while;
        
	select * from resTab;
    
END