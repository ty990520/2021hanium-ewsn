package com.hanium.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanium.domain.Criteria;
import com.hanium.domain.PageDTO;
import com.hanium.domain.UserVO;
import com.hanium.service.DeptService;
import com.hanium.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	private UserService service;
	private DeptService service_dept;

	@PostMapping({ "/join2" })
	public void login() {
	}

	@GetMapping({ "/join", "login", "join3" })
	public void join() {
	}

	@GetMapping("/admin_menu")
	public void admin_menu(Model model) {
		model.addAttribute("deptList", service_dept.getDeptList());
	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("pageMaker", new PageDTO(cri, service.count(cri)));
		log.info(service.count(cri));
		model.addAttribute("list", service.getList(cri));
	}

	@GetMapping("/user_request")
	public void userRequestlist(Criteria cri, Model model) {
		model.addAttribute("cri", cri);
		model.addAttribute("userRequest", service.getUserRequest(cri));
	}

	@GetMapping("/admin_request")
	public void adminRequestlist(Criteria cri, Model model) {
		model.addAttribute("cri", cri);
		model.addAttribute("adminRequest", service.getAdminRequest(cri));
	}

	@PostMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) {
		service.register(user);
		rttr.addFlashAttribute("result", user.getUserid());
		return "redirect:/user/join3";
	}

	@PostMapping("/update_userdept")
	public String updateUserDept(String userptype, String userdept, String userid, RedirectAttributes rttr) {
		if (service.updateUserDept(userptype, userdept, userid)) {
			log.info("success");
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/user/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("userid") String userid, Model model) {
		model.addAttribute("user", service.get(userid));
	}

	@GetMapping(value = "/findUserDept")
	public @ResponseBody UserVO findUserDept(@RequestParam("userid") String userid) {
		UserVO user = service.get(userid);
		// log.info(user.getUsername());
		return user;
	}

	@PostMapping("/modify")
	public String modify(UserVO user) {
		/*
		 * log.info(user.getUserid()); log.info(user.getUsername());
		 * log.info(user.getUserphone()); log.info(user.getUserbirth());
		 */

		service.modify(user);
		return "redirect:/user/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/valid")
	public String valid(@RequestParam("userid") String userid) {
		userid = userid.toString();
		UserVO user = service.findNotOnlyUser(userid);

		// log.info(service.findUserValidity(userid));
		// 1. 사번 유효성 검증
		if (service.findUserValidity(userid)) {
			// log.info("[ CONTROLLER ] 사번이 유효합니다.");
			// 2. user valid check
			service.setUserValid(user);
			return "success";

		} else {
			// log.info("[ CONTROLLER ] 사번이 유효하지 않음");
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping("/permission")
	public String permission(@RequestParam("userid") String userid) {
		userid = userid.toString();
		log.info("-------------------------------");
		log.info("[ CONTROLLER ] " + userid);
		UserVO user = service.findNotOnlyUser(userid);
		log.info(user.getUsername());
		service.setUserPermission(user);
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/user_login", produces = "application/text; charset=UTF-8")
	public String login(HttpServletRequest request, @RequestParam("userid") String userid,
			@RequestParam("userpw") String userpw) throws Exception {
		log.info(userid + "," + userpw);
		UserVO user = service.get(userid);
		log.info(user);
		if (user == null) {
			log.info("[ CONTROLLER ] 로그인 실패");
			return "로그인에 실패하였습니다.";
		} else {
			if (service.login(userid, userpw)) {
				String username = user.getUsername();
				log.info("[ CONTROLLER ] 로그인 성공 : " + username);
				HttpSession session = request.getSession();
				String login_name = username;
				String login_id = user.getUserid();
				String login_pw = user.getUserpw();
				String login_dept = user.getUserdept();
				String login_ptype = user.getUserptype();
				
				session.setAttribute("login_name", login_name);
				session.setAttribute("login_id", login_id);
				session.setAttribute("login_pw", login_pw);
				session.setAttribute("login_dept", login_dept);
				session.setAttribute("login_ptype", login_ptype);
				
				//최고관리자 권한
				if(login_id.equals("admin")) {
					session.setAttribute("admin", true);
				}else
					session.setAttribute("admin", null);
				return username + "님 환영합니다!";

			} else {
				log.info("[ CONTROLLER ] 로그인 실패");
				return "로그인에 실패하였습니다.";
			}
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/mypage")
	public void mypage(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("login_id");
		UserVO user = service.get(userid);
		model.addAttribute("user", user);
	}

	@RequestMapping("/dropout")
	public String dropout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("login_id");
		service.dropout(userid);
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/updatePw")
	public String updatePw(HttpServletRequest request,@RequestParam("userid") String userid,@RequestParam("userpw") String userpw) {
		service.updatePassword(userpw, userid);
		HttpSession session = request.getSession();
		session.setAttribute("login_pw", userpw);
		return "redirect:/user/mypage";
	}

}
