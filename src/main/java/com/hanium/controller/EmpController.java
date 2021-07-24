package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.EmpVO;
import com.hanium.service.EmpService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/emp/*")
@AllArgsConstructor
public class EmpController {
	private EmpService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")
	public String register(EmpVO emp) {
		service.register(emp);
		return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("empid") String empid, Model model) {
		model.addAttribute("EP", service.get(empid));
	} 
	
	@PostMapping("/modify")
	public String modify(EmpVO emp) {
		service.modify(emp);
		return "success";
	}
}
