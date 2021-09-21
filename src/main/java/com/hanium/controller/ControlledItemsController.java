package com.hanium.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/CI_manage_list")
	public void list(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList()); // Model에 bopVO의 목록을 담아서 전달

		// service2.getList().forEach(i->log.info(i));
	}

	@GetMapping("/CI_register")
	public void register_page() {
	}

	@PostMapping("/register") // 글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ControlledItemsVO ci) { // RedirectAttributes :
		log.info("[CONTROLLER]register : " + ci.getCI_type());
		log.info("[CONTROLLER]register : " + ci.getCI_detailType());
		log.info("[CONTROLLER]register : " + ci.getCI_detail_id());

		int count = service.detail_id_count(ci.getCI_detail_id())+1;
		String detail_real_id = ci.getCI_detail_id() +"."+ count;
		ci.setCI_detail_id(detail_real_id);
		
		service.register(ci);
		// rttr.addFlashAttribute("result",dept.getDeptcode());
		// return "redirect:/dept/list";
		return "redirect:/ControlledItems/CI_manage_list";

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
	
	@GetMapping(value = "/search_ci_list")
	public @ResponseBody List<ControlledItemsVO> search_ci_list(@RequestParam("type") String type) {
		log.info(type);
		String ci_type = "";
		if(type.equals("BOP DA")) {
			ci_type ="CI_BOP" ;
		}
		else if (type.equals("EP DA")) {
			ci_type="CI_EP";
		}
		else if (type.equals("PC/Server")) {
			ci_type="CI_pcServer";
		}
		else if (type.equals("Indirect DA")) {
			ci_type="CI_EP";
		}
		else if (type.equals("Control Facilities HF")) {
			ci_type="CI_CF_HF";
		}
		else if (type.equals("Control Facilities MF")) {
			ci_type="CI_CF_MF";
		}
	
		else if (type.equals("Control Facilities LF")) {
			ci_type="CI_CF_LF";
		}
	
		else if (type.equals("Field Facilities HF")) {
			ci_type="CI_FF_HF";
		}
	
		else if (type.equals("Control Facilities MF")) {
			ci_type="CI_FF_MF";
		}
	
		else if (type.equals("Control Facilities LF")) {
			ci_type="CI_FF_LF";
		}
	
		
		List<ControlledItemsVO> search_results = service.type(ci_type);
		search_results.forEach(i -> log.info(i));
		return search_results;
	}
}
