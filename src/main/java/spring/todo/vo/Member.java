package spring.todo.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {

	private int no;			//번호
	private String id; 		//아이디
	private String pwd;		//비밀번호
	private String email;	//이메일
	private	Date regdate;	//등록일
	private String auth;		//권한
	private int	todo_idx;	//할일에 대한 외래키
	
	
}
