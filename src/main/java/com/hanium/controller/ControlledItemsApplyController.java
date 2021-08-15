package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.ControlledItemsApplyVO;
import com.hanium.service.ControlledItemsApplyService;
import com.hanium.service.DAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ControlledItemsApply/*")
@AllArgsConstructor
public class ControlledItemsApplyController {
	
	private ControlledItemsApplyService service;
	//private DAService service_da;
	

	@GetMapping("/CI_list")
	public void list(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList()); // Model에 BoardVO의 목록을 담아서 전달
	}
	

	@GetMapping("/CI_select_print")
	public void list2(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList()); // Model에 BoardVO의 목록을 담아서 전달
	}
	
	@GetMapping("/CI_list_apply")
	public void register_page() {
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ControlledItemsApplyVO cia) {	//RedirectAttributes : 
		log.info("[CONTROLLER]register : "+cia);
	    service.register(cia);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
	    return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("CI_apply_no") Long CI_apply_no, Model model) {
	    log.info("[ CONTROLLER ] get ……..");
	    model.addAttribute("cia", service.get(CI_apply_no));
	}
	
	@PostMapping("/modify")
	public String modify(ControlledItemsApplyVO cia) {
	    log.info("[ CONTROLLER ] modify:" + cia);
	    service.modify(cia);
	    return "success";
	}
	
	
}
