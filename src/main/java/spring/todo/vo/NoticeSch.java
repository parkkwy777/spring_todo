package spring.todo.vo;

public class NoticeSch {
	private int curPage;   //현재 페이지
	private int totalCnt;  //전체 숫자
	private int pageSize;  //한 페이지에 보여질 컨탠츠 수 5
	
	private int start;		//sch.getTotalCnt()<sch.getPageSize()? 0:(sch.getPageSize()*sch.getCurPage())-sch.getPageSize()
	
	private int blockSize; // 10
	private int totalBlock; //sch.setTotalBlock((int)Math.ceil((double)sch.getTotalCnt()/sch.getPageSize()));
	private int block;	   //블럭 구분을 나눔  sch.setBlock((int)Math.ceil(((double)sch.getCurPage()/sch.getBlockSize())));
	private int statBlock; //sch.setStatBlock((sch.getBlock()-1)*sch.getBlockSize()+1);
	private int endBlock;  //sch.setEndBlock((sch.getStatBlock()+sch.getBlockSize()-1)>sch.getTotalBlock()? sch.getTotalBlock():(sch.getStatBlock()+sch.getBlockSize()-1));
	
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getBlock() {
		return block;
	}
	public void setBlock(int block) {
		this.block = block;
	}
	public int getStatBlock() {
		return statBlock;
	}
	public void setStatBlock(int statBlock) {
		this.statBlock = statBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	
}

