package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanium.domain.BOPVO;
import com.hanium.service.BOPService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/BOP/*")
@AllArgsConstructor
public class BOPController {
private BOPService service;
	
	@GetMapping("/list")
	public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list",service.getList());	//Model에 bopVO의 목록을 담아서 전달
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(BOPVO bop) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+bop);
	    service.register(bop);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
	    return "success";
	}
	
	/*@GetMapping("/get")
	public void get(@RequestParam("bnoNo") Long bnoNo, Model model) {
	    log.info("[ CONTROLLER ] get ……..");
	    model.addAttribute("dept", service.get(bnoNo));
	}*/
	
	@PostMapping("/modify")
	public String modify(BOPVO bop) {
	    log.info("[ CONTROLLER ] modify:" + bop);
	    service.modify(bop);
	    return "success";
	}
	
}
