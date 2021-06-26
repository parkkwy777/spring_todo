DROP TABLE todo;
DROP table part;
DROP TABLE partPlace;


CREATE table todo(
 	idx 		INT,							
	writer	VARCHAR(100),				
	title		VARCHAR(200),					
	content 	VARCHAR(500),			
	dday	 	DATETIME,				
	state		INT,						
	cCode		INT,						
 	pCode		INT
 );
 
ALTER TABLE todo ADD PRIMARY KEY(idx);    
ALTER TABLE todo MODIFY idx INT NOT NULL AUTO_INCREMENT;
ALTER TABLE todo AUTO_INCREMENT =1; 


CREATE TABLE part(
 	cCode INT,
 	NAME VARCHAR(100),
 	pCode INT
 );

ALTER TABLE part ADD PRIMARY KEY(cCode);    
ALTER TABLE part MODIFY cCode INT NOT NULL AUTO_INCREMENT;
ALTER TABLE part AUTO_INCREMENT =1;  


CREATE TABLE partPlace(
	pCode int,
  	place VARCHAR(100),
	counting INT
  );
  
  -- 해당 주소에서 할일을 얼마나 실행했는가에 대한 카운팅.-->
  
ALTER TABLE partPlace ADD PRIMARY KEY(pCode);    
ALTER TABLE partPlace MODIFY pCode INT NOT NULL AUTO_INCREMENT;
ALTER TABLE partPlace AUTO_INCREMENT =1;  
 

ALTER TABLE todo 
ADD CONSTRAINT todo_FK_part
FOREIGN KEY (cCode)
REFERENCES part(cCode);

ALTER TABLE todo 
ADD CONSTRAINT todo_FK_partPlace
FOREIGN KEY (pCode)
REFERENCES partPlace(pCode);

ALTER TABLE part
ADD CONSTRAINT part_FK_partPlace
FOREIGN KEY(pCode)
REFERENCES partPlace(pCode)

SELECT *FROM partPlace;
--공부 
INSERT INTO partPlace 
VALUES(pCode,'집',0);
INSERT INTO partPlace 
VALUES(pCode,'도서관',0);
--식사
INSERT INTO partPlace 
VALUES(pCode,'식당(외식)',0);

--운동
INSERT INTO partPlace 
VALUES(pCode,'헬스장',0);
INSERT INTO partPlace 
VALUES(pCode,'수영장',0);

SELECT *FROM partPlace;
--취미활동 
INSERT INTO partPlace 
VALUES(pCode,'카페',0);

--기타
INSERT INTO partPlace 
VALUES(pCode,'운동장',0);


INSERT INTO part
VALUES(cCode,'공부',1);
INSERT INTO part
VALUES(cCode,'공부',2);
INSERT INTO part
VALUES(cCode,'공부',6);

INSERT INTO part 
VALUES(cCode,'식사',1);
INSERT INTO part 
VALUES(cCode,'식사',3);
INSERT INTO part 
VALUES(cCode,'운동',4);
INSERT INTO part 
VALUES(cCode,'운동',5);
INSERT INTO part 
VALUES(cCode,'취미활동',1); 
INSERT INTO part 
VALUES(cCode,'취미활동',6);

INSERT INTO part 
VALUES(cCode,'기타',1); 
INSERT INTO part 
VALUES(cCode,'기타',2);
INSERT INTO part 
VALUES(cCode,'기타',3);
INSERT INTO part 
VALUES(cCode,'기타',4);
INSERT INTO part 
VALUES(cCode,'기타',5);
INSERT INTO part 
VALUES(cCode,'기타',6);
INSERT INTO part 
VALUES(cCode,'기타',7);


INSERT INTO todo 
VALUES(idx,'작성자1','타이틀1','내용1',SYSDATE(),1,1,1);


SELECT *FROM part;

SELECT COUNT(A.counting) AS cnt,A.place,B.NAME from partPlace A 
INNER JOIN part B ON A.cCode=B.cCode
WHERE B.NAME = '공부'
AND A.place='집';


SELECT *FROM todo;
