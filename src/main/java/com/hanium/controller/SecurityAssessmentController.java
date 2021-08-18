package com.hanium.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanium.domain.BOPVO;
import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.EPVO;
import com.hanium.domain.IndirectDTO;
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
	public String registerIndirect(SecurityAssessmentVO sa, IndirectDTO ind) {
		IndirectVO realInd = new IndirectVO();
		
		realInd.setIndirectNo(ind.getIndirectNo());
		realInd.setIndIWPerformContent(ind.getIndIWPerformContent());
		realInd.setIndIWAlterContent(ind.getIndIWAlterContent());
		realInd.setIndDmgDetectContent(ind.getIndDmgDetectContent());
		realInd.setIndDmgDetectDoc(ind.getIndDmgDetectDoc());
		realInd.setIndDmgDetectASContent(ind.getIndDmgDetectASContent());
		realInd.setIndDmgDetectASDoc(ind.getIndDmgDetectASDoc());
		realInd.setIndETContent(ind.getIndETContent());
		realInd.setIndETDoc(ind.getIndETDoc());
		
		boolean result[]= {false,false,false,false,false};
		//log.info(ind.getCheckArray().length);
		for(int i=0; i<ind.getCheckArray().length;i++) {
			if(ind.getCheckArray()[i].equals("Y")) {
				result[i] = true;
			}	
			else
				result[i]= false;
			log.info(result[i]);
		}
		
		realInd.setIndIWPerformCheck(result[0]);
		realInd.setIndIWAlterCheck(result[1]);
		realInd.setIndDmgDetectCheck(result[2]);
		realInd.setIndDmgDetectASCheck(result[3]);
		realInd.setIndETCheck(result[4]);
		
		//return "ok";
		
		if (service.registerIndirect(sa, realInd))
			log.info("register success");
		return "redirect:/SecurityAssessment/list";
	}

	@GetMapping("/registerDirect")
	public String registerIndirect(@RequestParam("daid") String daid, @RequestParam("type") String type) {
		log.info(daid);
		SecurityAssessmentVO sa = new SecurityAssessmentVO();
		sa.setSA_daID(daid);
		sa.setSA_IdentifyType(type);
		service.register(sa);

		service5.updateIdentifyType(type, daid);
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
		log.info("[CONTROLLER]get list..." + service.count(cri));
		// int num = service.getList(cri)
		model.addAttribute("pageMaker", new PageDTO(cri, service.count(cri)));
		model.addAttribute("decide", service.getList(cri)); // Model에 BoardVO의 목록을 담아서 전달
		model.addAttribute("undecide", service.necessaryList());
	}

	/* modal search ajax */
	@GetMapping(value = "/search_keyword")
	public @ResponseBody List<DAVO> search_keyword(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		log.info(type + ":" + keyword);
		Criteria cri = new Criteria();
		cri.setType(type);
		cri.setKeyword(keyword);
		List<DAVO> search_results = service.search_necessaryList(cri);
		search_results.forEach(i -> log.info(i));
		return search_results;
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

	/* direct da 상세유형 분류 */
	@ResponseBody
	@RequestMapping(value = "/sortOut")
	public String sortOut(@RequestParam("daid") String daid) {
		daid = daid.toString();
		log.info(daid);
		DAVO da = service5.get(daid);
		log.info(da.getDaname());
		//log.info(da.getDaSystemSW());
		/*log.info(da.getDaReportIF().toString());
		log.info(da.getDaHMIType().toString());
		log.info(da.getDaModifiableOperationData().toString());
		log.info(da.getDaModifyOPAvailability().toString());
*/
		
		
		if (!da.getDaSystemSW().equals("Firmware")) {
			return "PC/Server";
		} else { // 시스템sw유형 == firmware
			if (!da.getDaReportIF().equals("Hard Wiring")) {
				if (da.getDaReportIF().equals("Ethernet")) {
					return "Control Facilities HF"; // == Telecomm Facilities HF
				} else if (da.getDaReportIF().equals("Serial")) {
					if (da.getDaHMIType().equals("External")) {
						if (da.getDaModifiableOperationData().equals("Control Logic")) {
							return "Control Facilities MF"; // == Telecomm Facilities MF
						} else if (da.getDaModifiableOperationData().equals("Firmware Setting")) {
							return "Control Facilities LF"; // == Telecomm Facilities LF
						}
					} else if (da.getDaHMIType().equals("Integral")) {
						if (da.getDaModifiableOperationData().equals("Operaing parameter")) {
							return "Field Facilities MF";
						} else if (da.getDaModifiableOperationData().equals("Firmware Setting")) {
							return "Field Facilities HF";
						}
					}
				}
			} else { // 통신IF == Hard Wiring
				if (da.getDaModifyOPAvailability().equals("N")) {
					return "Field Facilities LF";
				} else {
					if (da.getDaModifiableOperationData().equals("Operaing parameter")) {
						return "Field Facilities MF";
					} else if (da.getDaModifiableOperationData().equals("Firmware Setting")) {
						return "Field Facilities HF";
					}
				}
			}
		}
		return "err";

	}
}
