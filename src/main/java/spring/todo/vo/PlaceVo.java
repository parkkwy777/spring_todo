package spring.todo.vo;

public class PlaceVo {

	private int pCode;		//장소 번호
	private String place;  // 장소
	
	public PlaceVo() {
		// TODO Auto-generated constructor stub
	}
	
	public PlaceVo(int pCode, String place) {
		this.pCode = pCode;
		this.place = place;
	}
	
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	
	
	
}
