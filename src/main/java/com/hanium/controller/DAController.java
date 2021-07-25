package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.DAVO;
import com.hanium.service.DAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/DA/*")
@AllArgsConstructor
public class DAController {
private DAService service;
	
	@GetMapping("/list")
	public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list",service.getList());	//Model에 bopVO의 목록을 담아서 전달
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(DAVO da) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+da);
	    service.register(da);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
	    return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("daid") String daid, Model model) {
	    log.info("[ CONTROLLER ] get ……..");
	    model.addAttribute("DA", service.get(daid));
	}
	
	@PostMapping("/modify")
	public String modify(DAVO da) {
	    log.info("[ CONTROLLER ] modify:" + da);
	    service.modify(da);
	    return "success";
	}
	
}
