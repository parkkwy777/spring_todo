package spring.todo.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spring.todo.vo.Member;

@Repository
public interface MemberDao {

	//로그인(시큐리티방식)
	public Member login(String id);
	
	//로그인
	public Member login_proc(Member member);
	
	//회원가입
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
	public int join(Member member);
}
