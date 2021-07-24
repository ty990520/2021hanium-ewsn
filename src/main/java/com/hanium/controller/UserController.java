package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.UserVO;
import com.hanium.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private UserService service;

	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}

	@PostMapping("/register")
	public String register(UserVO user) {
		service.register(user);
		return "success";
	}

	@GetMapping("/get")
	public void get(@RequestParam("Userid") String userid, Model model) {
		model.addAttribute("user", service.get(userid));
	}

	@PostMapping("/modify")
	public String modify(UserVO user) {
		service.modify(user);
		return "success";
	}
}
