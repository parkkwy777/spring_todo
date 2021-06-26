package spring.todo.vo;

public class PartVo {
	private int cCode;		//분류 번호
	private String name;	//분류 이름
	
	public PartVo() {
		// TODO Auto-generated constructor stub
	}
	public PartVo(int cCode, String name) {
		this.cCode = cCode;
		this.name = name;
	}
	
	
	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
