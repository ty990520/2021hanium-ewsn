package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanium.domain.EPVO;
import com.hanium.service.EPService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/EP/*")
@AllArgsConstructor
public class EPController {
	private EPService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")
	public String register(EPVO ep) {
		service.register(ep);
		return "success";
	}
	
	/*@GetMapping("/get")
	public void get(@RequestParam("epNo") Long epNo, Model model) {
		model.addAttribute("EP", service.get(epNo));
	} */
	
	@PostMapping("/modify")
	public String modify(EPVO ep) {
		service.modify(ep);
		return "success";
	}
}
