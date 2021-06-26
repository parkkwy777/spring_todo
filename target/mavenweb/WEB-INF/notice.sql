drop table notice;

create table notice(
 	no int not null,
 	title varchar(200),
 	writer varchar(100),
 	dday datetime
 );
 
 ALTER TABLE notice MODIFY COLUMN no INT PRIMARY KEY;
 
 ALTER TABLE notice MODIFY no INT NOT NULL AUTO_INCREMENT;
 ALTER TABLE notice AUTO_INCREMENT = 1;
 

 select *from notice;
 

 
 load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/testDB.csv' 
 into table notice FIELDS TERMINATED BY ',' (title,writer) set dday = sysdate();
  
 Select 
 *
 from (
    select no, title, writer, dday from notice n limit 99990,10
 ) A inner join  notice B on A.no = B.no
  order by B.no desc;]
  
  
  
  /*
  	select *FROM notice
	order by no desc,dday desc
	LIMIT 999900,10;

 	Select 
 	*
 	from (
    	select no, title, writer, dday from notice n limit 99990,10
 	) A inner join  notice B on A.no = B.no
  	order by B.no desc;
  
  **/