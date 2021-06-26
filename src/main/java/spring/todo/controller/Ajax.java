package spring.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import spring.todo.service.TodoService;
import spring.todo.vo.TodoVo;

@Controller
@RequestMapping("/ajax")
public class Ajax{
	
	@Autowired(required=false)
	TodoService service;
	
	@RequestMapping("/place")
	public String place(@RequestParam("name") String name, Model d){
		
		d.addAttribute("place", service.getPlace(name));
		
		return "jsonView";
	}
	
	@RequestMapping("/state")
	@ResponseBody
	public Boolean state(TodoVo vo){
		if(service.updateState(vo)>0){
			System.out.println("?");
			return true;
		}else{
			System.out.println("??");
			return false;
		}
	}
	
	@RequestMapping("/log")
	public String log(@RequestParam("place") String place, Model d){
		d.addAttribute("log", service.cntLog(place));
		return "jsonView";
	}
	
	@RequestMapping("/delete")
	public Boolean delete(@RequestParam("idx") int idx){
		if(service.delete(idx)>0){
			return true;
		}else{
			return false;
		}
	}
	
}
