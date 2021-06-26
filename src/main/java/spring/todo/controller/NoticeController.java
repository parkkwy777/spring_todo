package spring.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.todo.service.NoticeService;
import spring.todo.vo.NoticeSch;
import spring.todo.vo.NoticeVo;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	
	@Autowired(required=false)
	private NoticeService service;
	
	@RequestMapping("/view")
	public String toDoView(NoticeSch sch,Model d){
		d.addAttribute("lists", service.getList(sch));
		d.addAttribute("paging", sch);
		
		return "noticeView";
	}
	
	@RequestMapping("/detail")
	public String todoInsert(NoticeVo vo, Model d){
		
		d.addAttribute("detail", service.detailView(vo));
		
		return "detailView";
	}

}
