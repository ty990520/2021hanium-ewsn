package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanium.domain.BOPVO;
import com.hanium.domain.Criteria;
import com.hanium.domain.EPVO;
import com.hanium.domain.IndirectVO;
import com.hanium.domain.PageDTO;
import com.hanium.domain.SecurityAssessmentVO;
import com.hanium.service.BOPService;
import com.hanium.service.DAService;
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
	private DAService service5;

	/* EP */
	@GetMapping({ "/assessEP", "/assessBOP", "/assessIndirect" })
	public void startAccess(@RequestParam("daid") String daid, Model model) {
		model.addAttribute("daid", daid);
	}

	// 글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	@PostMapping("/registerEP")
	public String registerEP(SecurityAssessmentVO sa, EPVO ep) {
		if (service.registerEP(sa, ep))
			log.info("register success");
		return "redirect:/SecurityAssessment/list";
	}

	@PostMapping("/registerBOP")
	public String registerBOP(SecurityAssessmentVO sa, BOPVO bop) {
		if (service.registerBOP(sa, bop))
			log.info("register success");
		return "redirect:/SecurityAssessment/list";
	}

	@PostMapping("/registerIndirect")
	public String registerIndirect(SecurityAssessmentVO sa, IndirectVO ind) {
		if (service.registerIndirect(sa, ind))
			log.info("register success");
		return "redirect:/SecurityAssessment/list";
	}
	
	@GetMapping("/registerDirect")
	public String registerIndirect(@RequestParam("daid") String daid) {
		log.info(daid);
		SecurityAssessmentVO sa = new SecurityAssessmentVO();
		sa.setSA_daID(daid);
		sa.setSA_IdentifyType("Direct DA");
		service.register(sa);
		
		service5.updateIdentifyType("Direct DA", daid);
		return "redirect:/SecurityAssessment/list";
	}

	@GetMapping({ "/ep_detail" })
	public void ep_detail(@RequestParam("epNo") Long epNo, Model model) {
		if (service2.get(epNo).getEpAlterDoc() == null) {
			log.info("null");
		} else
			log.info(service2.get(epNo).getEpAlterDoc());
		model.addAttribute("EP", service2.get(epNo));
	}

	@GetMapping({ "/bop_detail" })
	public void bop_detail(@RequestParam("bopNo") Long bopNo, Model model) {
		model.addAttribute("BOP", service3.get(bopNo));
	}

	@GetMapping({ "/indirect_detail" })
	public void indirect_detail(@RequestParam("indirectNo") Long indirectNo, Model model) {
		model.addAttribute("Indirect", service4.get(indirectNo));
	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) { // addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list..."+cri);
		//int num = service.getList(cri)
		model.addAttribute("pageMaker", new PageDTO(cri,12));
		model.addAttribute("decide", service.getList(cri)); // Model에 BoardVO의 목록을 담아서 전달
		model.addAttribute("undecide", service.necessaryList());
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
