package com.hanium.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanium.domain.CIArrDTO;
import com.hanium.domain.ControlledItemsApplyDTO;
import com.hanium.domain.ControlledItemsApplyVO;
import com.hanium.domain.ControlledItemsVO;
import com.hanium.domain.DAVO;
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

	private ControlledItemsApplyService service;
	private ControlledItemsService service_ci;
	private DAService service_da;

	@GetMapping("/CI_list")
	public void list(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList()); // Model에 BoardVO의 목록을 담아서 전달
	}

	@GetMapping("/CI_select_print")
	public void list2(@RequestParam("ci_version_no") Long ci_version_no, Model model) { // addAttribute메소드를 이용해 Model객체에
																						// 담아서 전달
		// log.info(ver);
		List<ControlledItemsApplyVO> cia = service.getCI(ci_version_no);
		cia.forEach(i -> log.info(i));

		/* 이 부분은 자꾸 자료형 에러나길래 그냥 이렇게 하나하나 코딩함.... */
		model.addAttribute("version", cia.get(0).getCI_apply_version());
		model.addAttribute("daid", cia.get(0).getCI_daID());
		model.addAttribute("datype", cia.get(0).getCI_daname());
		model.addAttribute("checkerid", cia.get(0).getCheckerID());
		model.addAttribute("applydate", cia.get(0).getCI_applyDate());

		// List<String>
		List<String> checkArr = new ArrayList<String>();
		List<String> contentArr = new ArrayList<String>();
		List<String> ciidArr = new ArrayList<String>();
		List<String> citypeArr = new ArrayList<String>();
		List<String> cidetypeArr = new ArrayList<String>();

		for (int i = 0; i < cia.size(); i++) {
			checkArr.add(cia.get(i).getCI_applyCheck());
			contentArr.add(cia.get(i).getCI_applyContent());
			ciidArr.add(cia.get(i).getCI_applyDetail_id());

			ControlledItemsVO ci = service_ci.get(cia.get(i).getCI_applyDetail_id());
			citypeArr.add(ci.getCI_type());
			cidetypeArr.add(ci.getCI_detailType());
		}

		List<CIArrDTO> ci_arr = new ArrayList<CIArrDTO>();
		for (int i = 0; i < cia.size(); i++) {
			ci_arr.add(new CIArrDTO(ciidArr.get(i), contentArr.get(i), checkArr.get(i), citypeArr.get(i),
					cidetypeArr.get(i)));
		}

		model.addAttribute("ci_arr", ci_arr);

		// model.addAttribute(cia);
		// model.addAttribute("cia", cia); // Model에 BoardVO의 목록을 담아서 전달
	}

	@GetMapping("/CI_list_apply")
	public void register_page(Model model) {

	}

	@PostMapping("/register") // 글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(HttpServletRequest request, ControlledItemsApplyDTO cia) { // RedirectAttributes :
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("login_id");
		int index = service.count();
		for (int i = 0; i < cia.getCI_applyContent().length; i++) {
			ControlledItemsApplyVO real_ci = new ControlledItemsApplyVO();
			real_ci.setCheckerID(userid);
			real_ci.setCI_apply_version(cia.getCI_apply_version());
			real_ci.setCI_applyCheck(cia.getCI_applyCheck()[i]);
			real_ci.setCI_applyContent(cia.getCI_applyContent()[i]);
			real_ci.setCI_applyDetail_id(cia.getCI_applyDetail_id()[i]);
			real_ci.setCI_daID(cia.getCI_daID());
			real_ci.setCI_daname(cia.getCI_daname());
			real_ci.setCi_version_no((long) index);
			service.register(real_ci);
		}

		return "redirect:/ControlledItemsApply/CI_list";

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

	@GetMapping(value = "/selectAr")
	public @ResponseBody DAVO selectAr(@RequestParam("daid") String ar) {
		DAVO davo = service_da.get(ar);
		return davo;
	}

}
