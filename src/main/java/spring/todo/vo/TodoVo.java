package spring.todo.vo;

import java.util.Date;

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
	
	
	public TodoVo() {
		// TODO Auto-generated constructor stub
	}
	
	public TodoVo(int idx, String writer, String title, String content, Date dday, int state, int cCode, 
			int pCode,String name, String place) {
		this.idx = idx;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.dday = dday;
		this.state = state;
		this.cCode = cCode;
		this.name = name;
		this.place = place;
	}
	
	

	

	public TodoVo(int idx, int state) {
		this.idx = idx;
		this.state = state;
	}

	



	public TodoVo(int count ,String place,String name) {
		this.count = count;
		this.place = place;
		this.name = name;
	}





	public TodoVo(String writer, String title, String content, int cCode, int pCode) {
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.cCode = cCode;
		this.pCode = pCode;
	}


	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}


	public String getPlace() {
		return place;
	}



	public void setPlace(String place) {
		this.place = place;
	}


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDday() {
		return dday;
	}
	public void setDday(Date dday) {
		this.dday = dday;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	
	
	
}
