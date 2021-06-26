drop table notice;

select *from notice;

create table notice(
 	no int not null,
 	title varchar(200),
 	writer varchar(100),
 	g_no	int,
 	dday datetime
 );

 ALTER TABLE notice MODIFY COLUMN no INT PRIMARY KEY;
-- ALTER TABLE notice MODIFY COLUMN g_no INT PRIMARY KEY;
 
 ALTER TABLE notice MODIFY no INT NOT NULL AUTO_INCREMENT;
 ALTER TABLE notice AUTO_INCREMENT = 1;
 
 ALTER TABLE notice DROP INDEX IDX_NOTICE1;
 CREATE INDEX IDX_NOTICE ON notice
 (title,g_no); 

 drop table gNotice;
 
 create table gNotice(
 	no int not null,
 	name varchar(200)
 );

 ALTER TABLE gNotice DROP PRIMARY KEY;

 ALTER TABLE gNotice MODIFY COLUMN no INT PRIMARY KEY;
 
 ALTER TABLE gNotice MODIFY no INT NOT NULL AUTO_INCREMENT;
 
 ALTER TABLE gNotice AUTO_INCREMENT = 1;
 
insert into gnotice values(no,"그룹1");
insert into gnotice values(no,"그룹2");
insert into gnotice values(no,"그룹3");
insert into gnotice values(no,"그룹4");


-- insert into gnotice values(1,"그룹1");
-- insert into gnotice values(2,"그룹2");
-- insert into gnotice values(3,"그룹3");
-- insert into gnotice values(4,"그룹4");
 
 select *from gnotice;
 
 alter table notice
 add constraint
 foreign key (g_no)
 references gNotice (no);
  
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/testDB1.csv' 
into table notice CHARACTER SET utf8mb4 FIELDS TERMINATED BY ',' (title,writer,g_no) set dday = sysdate();
	
   
  explain select *from  
		 ( select @rownum:=@rownum1 as rownum,n1.* 
		  from notice n1,(select @rownum:=0) r ) n 
		  order by n.rownum desc,n.dday desc 
		  limit  999900,100;
      
      
 explain  Select 
	 A.*
	 from (
	    select no, title, writer, g_no, dday from notice n limit  999900,100
	 ) A inner join  notice B on A.no = B.no
	  order by a.no desc;
    
explain Select 
		 A.*
		 from (
		    select no, title, writer,g_no, dday from notice n limit 999900,100
		 ) A inner join  notice B on A.no = B.no 
		 where A.g_no=b.g_no and b.g_no=4
		 order by B.no desc;    
  
 explain Select 
		 A.*
		 from (
		    select no, title, writer,g_no, dday from notice n limit 999900,100
     ) A inner join  notice B on A.no = B.no 
		 where A.title = b.title and a.title='타이틀3'
		 order by B.no desc;
     
     
-- order by
explain Select 
	 A.*
	 from (
	    select no, title, writer,g_no, dday from notice n limit 999900,100
	 ) A inner join  notice B on A.no = B.no 
	 order by a.g_no desc;
   
   explain Select 
	 A.*
	 from (
	    select no, title, writer,g_no, dday from notice n limit 999900,100
	 ) A inner join  notice B use index(IDX_NOTICE) on A.no = B.no
	 order by a.title desc;

  
 -- group by 
 
explain Select 
	 A.*,count(a.g_no)
	 from (
	    select no, title, writer,g_no, dday from notice n limit 999900,100
	 ) A inner join  notice B on A.no = B.no  
	 group by a.g_no;
   
   explain Select 
	 A.*,count(a.g_no)
	 from (
	    select no, title, writer,g_no, dday from notice n limit 999900,100
	 ) A inner join  notice B on A.no = B.no  
	 group by a.title;
   
   
   
   
select count(no) from notice
where writer ='작성자9999999' ;