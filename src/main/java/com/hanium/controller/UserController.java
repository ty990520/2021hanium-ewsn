package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanium.domain.UserVO;
import com.hanium.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private UserService service;

	@PostMapping({ "/join2" })
	public void login() {
	}

	@GetMapping({ "/join", "login", "join3", "admin_menu" })
	public void join() {
	}

	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}

	@GetMapping("/user_request")
	public void userRequestlist(Model model) {
		model.addAttribute("userRequest", service.getUserRequest());
	}

	@GetMapping("/admin_request")
	public void adminRequestlist(Model model) {
		model.addAttribute("adminRequest", service.getAdminRequest());
	}

	@PostMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) {
		service.register(user);
		rttr.addFlashAttribute("result", user.getUserid());
		return "redirect:/user/join3";
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

	@ResponseBody
	@RequestMapping(value = "/valid")
	public String valid(@RequestParam("userid") String userid) {
		userid = userid.toString();
		log.info("-------------------------------");
		log.info("[ CONTROLLER ] " + userid);
		UserVO user = service.get(userid);
		log.info(user.getUsername());

		// 1. 사번 유효성 검증
		if (service.findUserValidity(userid)) {
			log.info("[ CONTROLLER ] 사번이 유효합니다.");
			// 2. user valid check
			service.setUserValid(user);
			return "success";

		} else {
			log.info("[ CONTROLLER ] 사번이 유효하지 않음");
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping("/permission")
	public String permission(@RequestParam("userid") String userid) {
		userid=userid.toString();
		log.info("-------------------------------");
		log.info("[ CONTROLLER ] "+userid);
		UserVO user = service.get(userid);
		log.info(user.getUsername());
		service.setUserPermission(user);
		return "success";
	}
}
