package com.hanium.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.PageDTO;
import com.hanium.service.DAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/DA/*")
@AllArgsConstructor
public class DAController {
	private DAService service;

	// @RequestMapping()

	@GetMapping("/DA_list")
	public void list(Criteria cri, Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list..." + service.count(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.count(cri)));
		model.addAttribute("list", service.getList(cri)); // Model에 bopVO의 목록을 담아서 전달
	}


	@GetMapping("/DA_register")
	public void register_page() {
	}

	@PostMapping("/register") // 글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(HttpServletRequest request,DAVO da) { // RedirectAttributes :
		log.info("[CONTROLLER]register : " + da.getDaptype() + " " + da.getDaPDetailType());

		String daid = "";
		if (da.getDaptype().equals("수력")) {
			daid="H-";
			if (da.getDaPDetailType().equals("한강")) {
				daid+="01-";
			} else if (da.getDaPDetailType().equals("청평")) {
				daid+="02-";
			} else if (da.getDaPDetailType().equals("삼랑진")) {
				daid+="03-";
			} else if (da.getDaPDetailType().equals("무주")) {
				daid+="04-";
			} else if (da.getDaPDetailType().equals("산청")) {
				daid+="05-";
			} else if (da.getDaPDetailType().equals("양양")) {
				daid+="06-";
			} else if (da.getDaPDetailType().equals("청송")) {
				daid+="07-";
			}
		} else if (da.getDaptype().equals("원자력")) {
			daid="N-";
			if (da.getDaPDetailType().equals("고리")) {
				daid+="01-";
			} else if (da.getDaPDetailType().equals("한빛")) {
				daid+="02-";
			} else if (da.getDaPDetailType().equals("월성")) {
				daid+="03-";
			} else if (da.getDaPDetailType().equals("한울")) {
				daid+="04-";
			} else if (da.getDaPDetailType().equals("새울")) {
				daid+="05-";
			}
		} else if (da.getDaptype().equals("화력")) {
			daid="F-";
			if (da.getDaPDetailType().equals("남동")) {
				daid+="01-";
			} else if (da.getDaPDetailType().equals("중부")) {
				daid+="02-";
			} else if (da.getDaPDetailType().equals("서부")) {
				daid+="03-";
			} else if (da.getDaPDetailType().equals("남부")) {
				daid+="04-";
			} else if (da.getDaPDetailType().equals("동서")) {
				daid+="05-";
			}
		}
		daid+=String.format("%04d", service.seq());
		log.info(daid);
		da.setDaid(daid);
		HttpSession session = request.getSession();
		String daRegistrarID=(String) session.getAttribute("login_id");
		log.info(daRegistrarID);
		da.setDaRegistrarID(daRegistrarID);
		service.register(da);
		// rttr.addFlashAttribute("result",dept.getDeptcode());
		// return "redirect:/dept/list";
		return "redirect:/DA/DA_list";
		
	}

	@GetMapping("/DA_detail")
	public void get(@RequestParam("daid") String daid, Model model) {
		log.info("[ CONTROLLER ] get ……..");
		model.addAttribute("da", service.get(daid));
	}

	@GetMapping("/DA_edit") // 수정 + 불러오기 -> get 방
	public void modify_page(@RequestParam("daid") String daid, Model model) {
		log.info("[ CONTROLLER ] get ……..");
		model.addAttribute("da", service.get(daid));
	}

	@PostMapping("/modify")
	public String modify(HttpServletRequest request,DAVO da) {
		log.info("[ CONTROLLER ] modify:" + da);
		Date time = new Date();
		da.setDaUpdateDate(time);
		
		HttpSession session = request.getSession();
		String daLastUpdateID=(String) session.getAttribute("login_id");
		log.info(daLastUpdateID);
		da.setDaLastUpdateID(daLastUpdateID);
		
		service.modify(da);
		return "redirect:/DA/DA_list";
	}

	@GetMapping("/remove")
	public String remove(@RequestParam("daid") String daid) {
		service.delete(daid);
		return "redirect:/DA/DA_list";
	}
}
