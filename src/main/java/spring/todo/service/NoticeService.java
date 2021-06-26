package spring.todo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.todo.repository.NoticeDao;
import spring.todo.vo.NoticeSch;
import spring.todo.vo.NoticeVo;

@Service
public class NoticeService {

	@Autowired(required=false)
	private NoticeDao dao;
	
	public ArrayList<NoticeVo> getList(NoticeSch sch){
		
		//페이지 선택이 없을때 초기값 1페이지
		if(sch.getCurPage()==0){
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0){
			sch.setPageSize(10);
		}
		//콘텐츠 부분
		
		//sch.setStart((sch.getCurPage()*sch.getPageSize())-sch.getPageSize()); //limit연산처리 시작값 (1*5)-5
		sch.setTotalCnt(dao.getTotalCntN());	//total값 가져옴
		sch.setStart(sch.getTotalCnt()<sch.getPageSize()? 0:(sch.getPageSize()*sch.getCurPage())-sch.getPageSize());
		/*sch.setStart(sch.getTotalCnt()<sch.getPageSize()? 0: sch.getTotalCnt()-(sch.getPageSize()*sch.getCurPage()));*/
		//sch.setStart(sch.getTotalCnt()-(sch.getPageSize()*sch.getCurPage()));
		System.out.println(sch.getStart());
		/*
		 * 
		 * 
			int block=(curPage%blockSize);
			
				System.out.println(block==0? (curPage/blockSize): (curPage/blockSize)+1);
				//나머지가 0이면 블럭값 그대로 그게 아니면 +1  ex) 5%3 = 나머지 2  blocksize의 배수 아니면  (5/3)+1 처리  
		 * 
		 */
		
		//블럭부분
		if(sch.getBlockSize()==0){
			sch.setBlockSize(10);
		}
		
		
		sch.setTotalBlock((int)Math.ceil((double)sch.getTotalCnt()/sch.getPageSize()));
		sch.setBlock((int)Math.ceil(((double)sch.getCurPage()/sch.getBlockSize())));  //
	
		//int block=(sch.getCurPage()%sch.getBlockSize());
		//sch.setBlock(block==0 ? (sch.getCurPage()/sch.getBlockSize()) 
		//								: (sch.getCurPage()/sch.getBlockSize())+1);
		
		sch.setStatBlock((sch.getBlock()-1)*sch.getBlockSize()+1);
		sch.setEndBlock((sch.getStatBlock()+sch.getBlockSize()-1)>sch.getTotalBlock()? sch.getTotalBlock():(sch.getStatBlock()+sch.getBlockSize()-1));
								//총 블럭이 블럭구간별 end블럭보다  총 블럭사이즈가 적다면 총블럭사이즈가 끝이되야함. but totalblock 더 크다면 구간별 endblock보여줌 )  
		//${paging.endBlock>paging.totalBlock ? paging.totalBlock: paging.endBlock }
		//sch.setEndBlock(sch.getTotalCnt()%sch.getCurPage()==0 ? (sch.getStatBlock()+sch.getBlockSize())-1 : sch.getStatBlock()+sch.getTotalCnt()%sch.getPageSize());
									// 블럭수가 딱 맞게 떨어지면 			시작에서 ~블럭 사이즈만큼 더한다. 0부터 시작이기때문에 -1 해줌 /  딱 맞지않다면 몇번 블럭을 늘려줄것인지 처리 나머지만큼.
		System.out.println("서비스");
		return dao.getListN(sch);
	}
	
	public NoticeVo detailView(NoticeVo vo){
		vo.setNo(vo.getNo());
		return dao.detailViewN(vo);
	}
	
	
	private String toStr(String str) {
		return str==null?"":str;
	}
	private int toInt(String intS) {
		return intS==null?0:new Integer(intS);
	}
	
}
