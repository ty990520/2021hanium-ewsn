package com.hanium.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanium.domain.ActionRecommendDTO;
import com.hanium.domain.ActionRecommendVO;
import com.hanium.domain.ControlledItemsVO;
import com.hanium.domain.DAVO;
import com.hanium.domain.VulnerabilityVO;
import com.hanium.service.ActionRecommendService;
import com.hanium.service.ControlledItemsService;
import com.hanium.service.ValTargetFacilityService;
import com.hanium.service.VulnerabilityService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ActionRecommend/*")
@AllArgsConstructor
public class ActionRecommendController {
	private ActionRecommendService service;
	private VulnerabilityService service_vul;
	private ValTargetFacilityService service_Fac;

	@GetMapping("/list")
	public void list(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList());
	}

	@GetMapping("/register_pre")
	public void register_page(Model model) {
		model.addAttribute("vul", service_vul.getList()); // 취약점명

	}

	@GetMapping("/register")
	public void register_page2() {

	}

	@PostMapping("/register") // 글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(ActionRecommendVO ar) { // RedirectAttributes :
		log.info("[CONTROLLER]register : " + ar);
		service.register(ar);
		// rttr.addFlashAttribute("result",dept.getDeptcode());
		// return "redirect:/dept/list";
		return "redirect:/ActionRecommend/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("AR_no") Long AR_no, Model model) {
		model.addAttribute("ar", service.get(AR_no));
		model.addAttribute("RegistrarID", service.get(AR_no).getRegistrarID());
	}

	@PostMapping("/modify")
	public String modify(ActionRecommendVO ar) {
		log.info("[ CONTROLLER ] modify:" + ar);
		service.modify(ar);
		return "success";
	}

	@GetMapping(value = "/selectAr")
	public @ResponseBody ActionRecommendDTO selectAr(@RequestParam("Vul_id") Long Vul_id, @RequestParam("ci_detail_id") String ci_detail_id) {
		if (ci_detail_id.equals("")) {
			VulnerabilityVO vul = service_vul.get(Vul_id);
			ActionRecommendDTO vul_ar = new ActionRecommendDTO(vul.getVul_Manufacturer(),vul.getVal_model(),vul.getVal_systemSW());
			log.info(vul_ar);
			return vul_ar;
		}else {
			ActionRecommendDTO ar_dto = service.get_dto(Vul_id);
			return ar_dto;
		}

	}
	@GetMapping(value = "/select_ci_number")
	public @ResponseBody List<DAVO> search_keyword(@RequestParam("Vul_id") int vul) {
		log.info(vul);
		List<DAVO> ci_list = service_Fac.targetDAList(vul);
		
		ci_list.forEach(i -> log.info(i));
		return ci_list;
	}
}

