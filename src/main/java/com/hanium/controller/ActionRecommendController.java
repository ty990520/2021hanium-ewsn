package com.hanium.controller;

import java.util.ArrayList;
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
import com.hanium.domain.ValTargetFacilityVO;
import com.hanium.domain.VulnerabilityVO;
import com.hanium.service.ActionRecommendService;
import com.hanium.service.ControlledItemsService;
import com.hanium.service.DAService;
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
	private ControlledItemsService service_ci;
	private DAService service_da;

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
	public void register_page2(@RequestParam("daid") String daid, Model model) {
		model.addAttribute("da", service_da.get(daid));

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
	public @ResponseBody ActionRecommendDTO selectAr(@RequestParam("Vul_id") Long Vul_id,
			@RequestParam("ci_detail_id") String ci_detail_id) {
		if (ci_detail_id.equals("")) {
			VulnerabilityVO vul = service_vul.get(Vul_id);
			ActionRecommendDTO vul_ar = new ActionRecommendDTO(vul.getVul_Manufacturer(), vul.getVal_model(),
					vul.getVal_systemSW());
			log.info(vul_ar);
			return vul_ar;
		} else {
			ActionRecommendDTO ar_dto = service.get_dto(Vul_id);
			return ar_dto;
		}

	}

	@GetMapping(value = "/select_ci_number")
	public @ResponseBody List<DAVO> search_keyword(@RequestParam("Vul_id") int vul_id) {

		VulnerabilityVO vul = service_vul.get((long) vul_id);

		/* 갱신 데이터 */
		List<DAVO> da = null;
		if (service_da.getVulTargetList_CI(vul.getVul_Manufacturer(), vul.getVal_model(), vul.getVal_systemSW(), vul_id).isEmpty()) {
			log.info("null");
		} else {
			log.info("갱신 점검 da 존재");
			da = service_da.getVulTargetList_CI(vul.getVul_Manufacturer(), vul.getVal_model(), vul.getVal_systemSW(),
					vul_id);
			//da.forEach(i -> log.info(i));
		}

		ControlledItemsVO ci = null;
		if (vul.getVul_ci_id() != null)
			ci = service_ci.get(vul.getVul_ci_id().toString());

		// 대상 설비 DA데이터 갱신
		if (da != null) {
			// 통제항목 있는 경우
			if (ci != null) {
				log.info("통제항목 있음");
				List<String> yes_da = new ArrayList<String>();
				if (ci.getCI_BOP().toString().equals("Y")) {
					yes_da.add("BOP DA");

				}
				if (ci.getCI_EP().toString().equals("Y")) {
					yes_da.add("EP DA");
				}
				if (ci.getCI_indirect().toString().equals("Y")) {
					yes_da.add("Indirect DA");
				}
				if (ci.getCI_CF_HF().toString().equals("Y")) {
					yes_da.add("Control Facilities HF");
				}
				if (ci.getCI_CF_MF().toString().equals("Y")) {
					yes_da.add("Control Facilities LF");
				}
				if (ci.getCI_CF_LF().toString().equals("Y")) {
					yes_da.add("Control Facilities LF");
				}
				if (ci.getCI_FF_HF().toString().equals("Y")) {
					yes_da.add("Field Facilities HF");
				}
				if (ci.getCI_FF_MF().toString().equals("Y")) {
					yes_da.add("Field Facilities MF");
				}
				if (ci.getCI_FF_LF().toString().equals("Y")) {
					yes_da.add("Field Facilities LF");
				}
				if (ci.getCI_pcServer().toString().equals("Y")) {
					yes_da.add("PC/Server");
				}

				ValTargetFacilityVO vulfacility = new ValTargetFacilityVO();
				for (int i = 0; i < da.size(); i++) {
					// log.info("[DA] "+da.get(i).getDaIdentifyType());
					for (int j = 0; j < yes_da.size(); j++) {
						// log.info("[yes_da] "+yes_da.get(j));
						if (yes_da.get(j).equals(da.get(i).getDaIdentifyType())) {
							vulfacility.setVul_daID(da.get(i).getDaid());
							vulfacility.setVul_daName(da.get(i).getDaname());
							vulfacility.setVul_id(vul_id);
							log.info(vulfacility);
							service_Fac.register(vulfacility);
						}
					}
				}
				log.info("대상 설비 갱신 완료");
			} else {
				log.info("통제항목 없음");
				ValTargetFacilityVO vulfacility = new ValTargetFacilityVO();

				for (int i = 0; i < da.size(); i++) {
					vulfacility.setVul_daID(da.get(i).getDaid());
					vulfacility.setVul_daName(da.get(i).getDaname());
					vulfacility.setVul_id(vul_id);
					service_Fac.register(vulfacility);
				}
				log.info("대상 설비 갱신 완료");
			}
		}

		List<DAVO> ci_list = service_Fac.targetDAList(vul_id);

		//ci_list.forEach(i -> log.info(i));
		return ci_list;
	}
}
