package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}

	@PostMapping("/register")
	public String register(RepresentCodeVO rc) {
		service.register(rc);
		return "success";
	}

	@GetMapping("/get")
	public void get(@RequestParam("R_code") String R_code, Model model) {
		model.addAttribute("rc", service.get(R_code));
	}

	@PostMapping("/modify")
	public String modify(RepresentCodeVO rc) {
		service.modify(rc);
		return "success";
	}
}
