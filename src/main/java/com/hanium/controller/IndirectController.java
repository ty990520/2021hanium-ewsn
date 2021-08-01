package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanium.domain.IndirectVO;
import com.hanium.service.IndirectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Indirect/*")
@AllArgsConstructor
public class IndirectController {
private IndirectService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")
	public String register(IndirectVO ind) {
		service.register(ind);
		return "success";
	}
	
	/*@GetMapping("/get")
	public void get(@RequestParam("IndirectNo") Long IndirectNo, Model model) {
		model.addAttribute("Indirect", service.get(IndirectNo));
	} */
	
	@PostMapping("/modify")
	public String modify(IndirectVO ind) {
		service.modify(ind);
		return "success";
	}
}
