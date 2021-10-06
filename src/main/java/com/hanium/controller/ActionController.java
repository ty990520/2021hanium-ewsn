package com.hanium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanium.domain.ActionImplementVO;
import com.hanium.domain.ActionRecommendVO;
import com.hanium.domain.ActionVO;
import com.hanium.domain.ControlledItemsVO;
import com.hanium.service.ActionImplementService;
import com.hanium.service.ActionRecommendService;
import com.hanium.service.ActionService;
import com.hanium.service.ControlledItemsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Action/*")
@AllArgsConstructor
	public class ActionController {
	private ActionService service;
	private ActionRecommendService service2;
	private ActionImplementService service3;
	private ControlledItemsService service4;
		
		@GetMapping("/list")
		public void list(Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
			log.info("[CONTROLLER]get list...");
			model.addAttribute("list",service.getList());	//Model에 bopVO의 목록을 담아서 전달
			
			//service2.getList().forEach(i->log.info(i));
		}
		@GetMapping("/register")
		public void register_page(Model model) {	
			model.addAttribute("ac_list",service2.getList_ac());
		}
		@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
		public String register(ActionVO action) {	//RedirectAttributes : 
		    log.info("[CONTROLLER]register : "+ action);
		   
		    service.register(action);
		    return "redirect:/Action/list";		
		    }
		
		@GetMapping("/get")
		public void get(@RequestParam("AC_no") Long AC_no,  Model model) {
		    log.info("[ CONTROLLER ] get ……..");
		    model.addAttribute("action", service.get(AC_no));
		    model.addAttribute("ai", service3.get(AC_no));
		   // model.addAttribute("controllItems", service4.		]);

		}
		@PostMapping("/modify")
		public String modify(ActionVO action) {
		    log.info("[ CONTROLLER ] modify:" + action);
		    service.modify(action);
		    return "redirect:/Action/list";
		}
		@GetMapping(value = "/selectAr")
		public @ResponseBody ActionRecommendVO selectAr(@RequestParam("AR_no") Long ar) {
			ActionRecommendVO arvo= service2.get(ar);
			log.info("Ar: "+arvo.getAR_daID());
			return arvo;
		}
		@PostMapping("/register2")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
		public String register2(ActionImplementVO ai) {	//RedirectAttributes : 
		    log.info("[CONTROLLER]register : "+ai);
		    log.info("[CONTROLLER]registerdddddd : "+ai.getAI_no());
		    service3.register(ai);
		    //rttr.addFlashAttribute("result",dept.getDeptcode());
		    //return "redirect:/dept/list";
		    return "redirect:/Action/get?AC_no="+ai.getAI_no();
		    
		}
}
