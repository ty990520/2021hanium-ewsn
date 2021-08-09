package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		//log.info("[CONTROLLER]get list..."+ service.getList());
		//log.info("[CONTROLLER]get list2..."+ service.get("PT01"));
		model.addAttribute("list", service.getReCodeList());
	}
	
	@GetMapping("/Code_deList")
	public void get(@RequestParam("r_code") String R_code, Model model) {
	    log.info("[ CONTROLLER ] get ……..");
	    model.addAttribute("list", service.getDeCodeList(R_code));
	}
	
	@GetMapping("/Code_reEnroll")
	public void register_page() {}
	
	@PostMapping("/register")
	public String register(RepresentCodeVO re) {
		 log.info("[CONTROLLER]register : "+re);
		service.register(re);
		return "redirect:/RepresentCode/Code_reList";
	}
	
	@ResponseBody
	@RequestMapping("/checkExistRecode")
	public String checkExistRecode(@RequestParam("R_code") String R_code) {
		R_code = R_code.toString();
		log.info("[ CONTROLLER ] " + service.checkExistRecode(R_code));
		if(service.checkExistRecode(R_code)) {
			return "exists";
		}
		else
			return "possible";
	}


	@PostMapping("/modify")
	public String modify(RepresentCodeVO re) {
		service.modify(re);
		return "success";
	}
}
