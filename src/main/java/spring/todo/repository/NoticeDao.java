package spring.todo.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import spring.todo.vo.NoticeSch;
import spring.todo.vo.NoticeVo;

@Repository
public interface NoticeDao {
	
	public int getTotalCntN();
	
	public ArrayList<NoticeVo> getListN(NoticeSch sch);
	
	public NoticeVo detailViewN(NoticeVo vo);
	
}
