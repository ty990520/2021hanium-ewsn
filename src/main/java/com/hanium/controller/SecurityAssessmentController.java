package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.SecurityAssessmentVO;
import com.hanium.service.BOPService;
import com.hanium.service.EPService;
import com.hanium.service.IndirectService;
import com.hanium.service.SecurityAssessmentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/SecurityAssessment/*")
@AllArgsConstructor
public class SecurityAssessmentController {
	private SecurityAssessmentService service;
	private EPService service2;
	private BOPService service3;
	private IndirectService service4;
	
	@GetMapping({"/assessEP","assessBOP","assessIndirect"})
	public void startEP() {
		
	}
	
	@GetMapping({"/ep_detail"})
	public void ep_detail(@RequestParam("epNo") Long epNo, Model model) {
		if(service2.get(epNo).getEpAlterDoc()==null) {
			log.info("null");
		}else
			log.info(service2.get(epNo).getEpAlterDoc());
		model.addAttribute("EP", service2.get(epNo));
	}
	
	@GetMapping({"/bop_detail"})
	public void bop_detail(@RequestParam("bnoNo") Long bnoNo, Model model) {
		model.addAttribute("BOP", service3.get(bnoNo));
	}
	
	@GetMapping({"/indirect_detail"})
	public void indirect_detail(@RequestParam("IndirectNo") Long IndirectNo, Model model) {
		model.addAttribute("Indirect", service4.get(IndirectNo));
	}
	
	@GetMapping("/list")
	public void list(Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list...");
		model.addAttribute("list", service.getList()); // Model에 BoardVO의 목록을 담아서 전달
	}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(SecurityAssessmentVO sa) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+sa);
	    service.register(sa);
	    //rttr.addFlashAttribute("result",sa.getsacode());
	    //return "redirect:/sa/list";
	    return "success";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("SA_no") Long SA_no, Model model) {
	    log.info("[ CONTROLLER ] get ……..");
	    model.addAttribute("sa", service.get(SA_no));
	}
	
	@PostMapping("/modify")
	public String modify(SecurityAssessmentVO sa) {
	    log.info("[ CONTROLLER ] modify:" + sa);
	    service.modify(sa);
	    return "success";
	}
}
