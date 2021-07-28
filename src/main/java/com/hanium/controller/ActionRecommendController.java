package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.ActionRecommendVO;
import com.hanium.service.ActionRecommendService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ActionRecommend/*")
@AllArgsConstructor
public class ActionRecommendController {
private ActionRecommendService service;
	
	@GetMapping("/list")
	public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ActionRecommendVO ar) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+ar);
	    service.register(ar);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
	    return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("AR_no") Long AR_no, Model model) {
		model.addAttribute("ar", service.get(AR_no));
	}
	
	@PostMapping("/modify")
	public String modify(ActionRecommendVO ar) {
	    log.info("[ CONTROLLER ] modify:" + ar);
	    service.modify(ar);
	    return "success";
	}
	
}