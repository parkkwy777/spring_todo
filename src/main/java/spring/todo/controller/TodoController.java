package spring.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.todo.service.TodoService;
import spring.todo.vo.Member;
import spring.todo.vo.NoticeSch;
import spring.todo.vo.TodoVo;


@Controller
@RequestMapping("/todo")
public class TodoController {

	
	@Autowired(required=false)
	private TodoService service;
	
	@RequestMapping("/view")
	public String toDoView(NoticeSch sch,Model d){
		d.addAttribute("lists", service.getList(sch));
		d.addAttribute("partName", service.getPartName());
		d.addAttribute("paging", sch);
		
		return "toDoView";
	}
	
	@RequestMapping("/insert")
	public String todoInsert(TodoVo vo, Model d){
		d.addAttribute("insRs", service.insertToDo(vo));
		return "toDoView";
	}
	
	@RequestMapping("/login")
	public String login(Member member,Model d){
		
		d.addAttribute("loginMember", service.login_proc(member));
		System.out.println(service.login_proc(member));
		return "login";
	}

	
	@RequestMapping("/login_proc")
	public String loginProc(Member member,Model d){
		
		d.addAttribute("loginMember", service.login_proc(member));
		System.out.println(service.login_proc(member));
		
		return "result";
	}
	
}
