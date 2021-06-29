package spring.todo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.todo.repository.MemberDao;
import spring.todo.vo.Member;


@Service
public class MemberService {

	@Autowired(required=false)
	private MemberDao dao;
	
	public Member login_proc(Member member){
		return dao.login_proc(member);
	}
	
	public Member login(String id){
		return dao.login(id);
	}
	
	public int join(Member member){
		
		return dao.join(member);
	}
	
}
