package spring.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.todo.service.MemberService;
import spring.todo.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired(required=false)
	private MemberService service;
	
	@RequestMapping("/login")
	public String login(Member member,Model d){
		return "login";
	}

	
	@RequestMapping("/join")
	public String join(Member member,Model d){
		
		if(member.getId()!=null && member.getId()!=""){
			System.out.println(member.getId());	
			d.addAttribute("joinRs", service.join(member));
		}
		return "join";
	}
	
}
