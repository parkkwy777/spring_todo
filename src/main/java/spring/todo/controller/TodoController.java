package spring.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import spring.todo.service.TodoService;
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

}
