package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.ActionImplementVO;
import com.hanium.service.ActionImplementService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ActionImplement/*")
@AllArgsConstructor
public class ActionImplementController {
	
private ActionImplementService service;
	
	@GetMapping("/list")
	public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ActionImplementVO ai) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+ai);
	    service.register(ai);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
	    return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("AI_no") Long AI_no, Model model) {
		model.addAttribute("ai", service.get(AI_no));
	}
	
	@PostMapping("/modify")
	public String modify(ActionImplementVO ai) {
	    log.info("[ CONTROLLER ] modify:" + ai);
	    service.modify(ai);
	    return "success";
	}
}
