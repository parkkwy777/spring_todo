CREATE TABLE member(
NO 			INT,
id 			VARCHAR(50),
pwd 			VARCHAR(50),
email			VARCHAR(50),
regdate		DATE,
todo_idx		int
);


ALTER TABLE member ADD PRIMARY KEY(NO);    
ALTER TABLE member MODIFY no INT NOT NULL AUTO_INCREMENT;
ALTER TABLE member AUTO_INCREMENT =1;  
 
ALTER TABLE member 
ADD CONSTRAINT member_FK_todo
FOREIGN KEY (todo_idx)
REFERENCES todo(idx);