
DROP TABLE member;


CREATE TABLE member(
NO 			INT,
id 			VARCHAR(50),
pwd 			VARCHAR(50),
NAME			VARCHAR(100),
email			VARCHAR(100),
phone			VARCHAR(100),
regdate		DATE,
auth			VARCHAR(50),
todo_idx		int
);


ALTER TABLE member ADD PRIMARY KEY(NO);    
ALTER TABLE member MODIFY no INT NOT NULL AUTO_INCREMENT;
ALTER TABLE member AUTO_INCREMENT =1;  
 
ALTER TABLE member 
ADD CONSTRAINT member_FK_todo
FOREIGN KEY (todo_idx)
REFERENCES todo(idx);

SELECT *FROM member;

SELECT *FROM todo;

INSERT INTO member 
VALUES(NO,'hjpark','1234','박형준','parkkwy777@ozcns.com','010-8923-0267', SYSDATE(),'ROLE_MEMBER',null);
