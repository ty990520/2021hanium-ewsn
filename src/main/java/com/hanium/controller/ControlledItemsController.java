package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.ls.LSException;

import com.hanium.domain.ControlledItemsVO;
import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.PageDTO;
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

		String type = ci.getCI_type().toString();
		String de_type = ci.getCI_detailType().toString();

		/* 1,2,3 */
		if (type.equals("기술적")) {
			type = 1 + "";

		} else if (type.equals("운영적")) {
			type = 2 + "";

		} else if (type.equals("관리적")) {
			type = 3 + "";
		} else if (type.equals("Baseline 보호기준")) {
			type = 4 + "";
		}

		/* DE_TYPE */

		/* 기술적 */
		if (de_type.equals("접근통제")) {
			de_type = 1 + "";
		} else if (de_type.equals("감사 및 책임")) {
			de_type = 2 + "";
		} else if (de_type.equals("시스템 및 통신의 보호")) {
			de_type = 3 + "";
		} else if (de_type.equals("식별 및 인증")) {
			de_type = 4 + "";
		} else if (de_type.equals("시스템 보안 강화")) {
			de_type = 5 + "";
		}

		/* 운영적 */
		if (de_type.equals("인적 보안")) {
			de_type = 1 + "";
		} else if (de_type.equals("시스템 및 정보 무결성")) {
			de_type = 2 + "";
		} else if (de_type.equals("유지보수")) {
			de_type = 3 + "";
		} else if (de_type.equals("물리적 및 환경적 보호")) {
			de_type = 4 + "";
		} else if (de_type.equals("인식제고 및 훈련")) {
			de_type = 5 + "";
		} else if (de_type.equals("형상관리")) {
			de_type = 6 + "";
		}

		/* 관리적 */
		if (de_type.equals("시스템 및 서비스 획득")) {
			de_type = 1 + "";
		} else if (de_type.equals("위험 관리")) {
			de_type = 2 + "";
		}

		/* 보호적 */
		if (de_type.equals("보호구역 위치 및 물리적 보호 조치 적용")) {
			de_type = 1 + "";
		} else if (de_type.equals("무선연결 사용 금지")) {
			de_type = 2 + "";
		} else if (de_type.equals("필수적인 통신 연결 외 통제 조치")) {
			de_type = 3 + "";
		} else if (de_type.equals("휴대용 매체 사용 통제")) {
			de_type = 4 + "";
		} else if (de_type.equals("설계 변경 전 사이버보안 측면 평가 수행")) {
			de_type = 5 + "";
		} else if (de_type.equals("주기적 기능 시험 수행")) {
			de_type = 6 + "";
		} else if (de_type.equals("주기적 사이버보안 평가 수행")) {
			de_type = 7 + "";
		}

		ci.setCI_detail_id(type + "." + de_type);

		log.info(ci.getCI_pcServer());
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
}
