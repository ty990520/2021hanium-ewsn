package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.ValTargetFacilityVO;
import com.hanium.service.ValTargetFacilityService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ValTargetFacility/*")
@AllArgsConstructor

public class ValTargetFacilityController {
private ValTargetFacilityService service;
	
	@GetMapping("/list")
	public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ValTargetFacilityVO vul) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+vul);
	    service.register(vul);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
	    return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("Vul_targetId") String Vul_targetId, Model model) {
		model.addAttribute("Vulfacility", service.get(Vul_targetId));
	}
	
	@PostMapping("/modify")
	public String modify(ValTargetFacilityVO vul) {
	    log.info("[ CONTROLLER ] modify:" + vul);
	    service.modify(vul);
	    return "success";
	}
	
}
