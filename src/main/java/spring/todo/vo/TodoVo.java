package spring.todo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TodoVo {

	private int idx;		//기본키
	private String writer;	//작성자
	private String title;	//타이틀
	private String content;	//내용
	private Date dday;		//날짜
	private int state;		//상태(성공1/실패2)
	private int cCode;		//분류 코드
	private int pCode; 		//장소 코드
	private String name;		//분류
	private String place;		//장소
	private int count;
		
}
