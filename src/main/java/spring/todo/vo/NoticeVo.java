package spring.todo.vo;

import java.util.Date;

public class NoticeVo {
	private int no;
	private String title;
	private Date dday;
	private String writer;
	

	
	public NoticeVo() {
	}

	public NoticeVo(int no, String title, String writer,Date dday) {
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.dday = dday;
		
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDday() {
		return dday;
	}
	public void setDday(Date dday) {
		this.dday = dday;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
