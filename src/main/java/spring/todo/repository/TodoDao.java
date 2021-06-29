package spring.todo.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.todo.vo.Member;
import spring.todo.vo.NoticeSch;
import spring.todo.vo.PartVo;
import spring.todo.vo.PlaceVo;
import spring.todo.vo.TodoVo;

@Repository
public interface TodoDao {

	//조회
	public ArrayList<TodoVo> getList(NoticeSch sch);
	//총건수
	public int getTotalCnt();
	
	//할일분류
	public ArrayList<PartVo> getPartName();
	
	//장소이름
	public ArrayList<PlaceVo> getPlace(String name);

	//할일 추가
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertToDo(TodoVo vo);
	
	//상태 업데이트
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updateState(TodoVo vo);

	//장소에 따른 할일 삭제 처리 (조인 사용하기 위해)
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
	public int inPlaceDelete(String place);

	//삭제
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
	public int delete(int idx);

	//분류와 장소에 따른 할일 수행 count
	public TodoVo cntLog(String place);
	

}
