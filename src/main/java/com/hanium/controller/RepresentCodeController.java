package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.PageDTO;
import com.hanium.domain.RepresentCodeVO;
import com.hanium.service.RepresentCodeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/RepresentCode/*")
@AllArgsConstructor
public class RepresentCodeController {
	private RepresentCodeService service;


	@GetMapping("/Code_reList")
	public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list..."+ service.getList());
		log.info("[CONTROLLER]get list2..."+ service.get("PT01"));
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/Code_deList")
	public void get(@RequestParam("r_code") String r_code, Model model) {
	    log.info("[ CONTROLLER ] get ……..");
	    model.addAttribute("re", service.get(r_code));
	}
	
	@GetMapping("/Code_reEnroll")
	public void register_page() {}
	
	@PostMapping("/register")
	public String register(RepresentCodeVO re) {
		 log.info("[CONTROLLER]register : "+re);
		service.register(re);
		return "redirect:/RepresentCode/Code_reList";
	}


	@PostMapping("/modify")
	public String modify(RepresentCodeVO re) {
		service.modify(re);
		return "success";
	}
}
