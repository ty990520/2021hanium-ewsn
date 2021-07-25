package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.ControlledItemsVO;
import com.hanium.service.ControlledItemsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ControlledItems/*")
@AllArgsConstructor
public class ControlledItemsController {
	private ControlledItemsService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")
	public String register(ControlledItemsVO ci) {
		service.register(ci);
		return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("CI_detail_id") String CI_detail_id, Model model) {
		model.addAttribute("ci", service.get(CI_detail_id));
	} 
	
	@PostMapping("/modify")
	public String modify(ControlledItemsVO ci) {
		service.modify(ci);
		return "success";
	}
}
