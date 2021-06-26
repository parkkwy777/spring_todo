

USE users;

create table todo(
 	idx 		INT,							
	writer	VARCHAR(100),				
	title		VARCHAR(200),					
	content 	VARCHAR(500),			
	dday	 	DATETIME,				
	state		INT,						
	cCode		int						
 );
 
ALTER TABLE todo ADD PRIMARY KEY(idx);    
ALTER TABLE todo MODIFY idx INT NOT NULL AUTO_INCREMENT;
ALTER TABLE todo AUTO_INCREMENT =1; 


 CREATE TABLE part(
 	cCode INT,
 	NAME VARCHAR(100)
 );
ALTER TABLE part ADD PRIMARY KEY(cCode);    
ALTER TABLE part MODIFY cCode INT NOT NULL AUTO_INCREMENT;
ALTER TABLE part AUTO_INCREMENT =1; 


 CREATE TABLE partPlace(
  	NAME VARCHAR(100),
  	place VARCHAR(100)
 );
ALTER TABLE partPlace ADD PRIMARY KEY(NAME);

 
ALTER TABLE todo 
ADD CONSTRAINT todo_FK_part
FOREIGN KEY (cCode)
REFERENCES part(cCode);

ALTER TABLE part 
ADD CONSTRAINT part_FK_partPlace
FOREIGN KEY (NAME)
REFERENCES partPlace(NAME);

INSERT INTO partPlace 
VALUES('회사','서울 어딘가');

INSERT INTO part
VALUES(cCode,'회사');

INSERT INTO todo 
VALUES(idx,'작성자1','타이틀1','내용1',SYSDATE(),1,1);

SELECT *FROM todo;