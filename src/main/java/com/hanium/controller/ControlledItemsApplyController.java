package com.hanium.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanium.domain.DAVO;
import com.hanium.domain.ControlledItemsApplyVO;
import com.hanium.domain.ControlledItemsVO;
import com.hanium.domain.Criteria;
import com.hanium.service.ControlledItemsApplyService;
import com.hanium.service.ControlledItemsService;
import com.hanium.service.DAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ControlledItemsApply/*")
@AllArgsConstructor
public class ControlledItemsApplyController {
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	private DAService service2;
	private ControlledItemsApplyService service;
	 private DAService service_da;
	 
	@GetMapping("/CI_list")
	public void list(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList()); // Model에 BoardVO의 목록을 담아서 전달
	}

	@GetMapping("/CI_select_print")
	public void get(@RequestParam("CI_applyDetail_id") String CI_applyDetail_id, Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
			log.info("[ CONTROLLER ] get ……..");
			model.addAttribute("cia", service.get(CI_applyDetail_id));
		}
	@GetMapping("/CI_list_apply")
	public void register_page(Model model, Criteria cia) {
		model.addAttribute("cia", service2.getList(cia));
	}

	@PostMapping("/register") // 글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ControlledItemsApplyVO cia) { // RedirectAttributes :
		log.info("[CONTROLLER]register : " + cia);
		service.register(cia);
		// rttr.addFlashAttribute("result",dept.getDeptcode());
		// return "redirect:/dept/list";
		return "success";
	}

	
	/*@GetMapping("/get")
	public void get(@RequestParam("CI_apply_no") Long CI_apply_no, Model model) {
		log.info("[ CONTROLLER ] get ……..");
		model.addAttribute("cia", service.get(CI_apply_no));
	}*/

	@PostMapping("/modify")
	public String modify(ControlledItemsApplyVO cia) {
		log.info("[ CONTROLLER ] modify:" + cia);
		service.modify(cia);
		return "success";
	}

	@GetMapping(value = "/selectAr")
	public @ResponseBody DAVO selectAr(@RequestParam("daid") String ar) {
		DAVO davo = service_da.get(ar);
		return davo;
	}

}
