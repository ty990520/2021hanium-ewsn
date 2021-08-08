package com.hanium.controller;

import java.util.Date;

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
	
	//@RequestMapping()

	@GetMapping("/DA_list")
	public void list(Criteria cri, Model model) {	//addAttribute메소드를 이용해 Model객체에 담아서 전달
		log.info("[CONTROLLER]get list..."+ service.count());
		model.addAttribute("pageMaker", new PageDTO(cri,service.count()));
		model.addAttribute("list",service.getList(cri));	//Model에 bopVO의 목록을 담아서 전달
	}
	
	@GetMapping("/DA_register")
	public void register_page() {}
	
	@PostMapping("/register")	//글을 등록하는 경우에는 get방식이 아니라 post방식을 사용한다.
	public String register(DAVO da ) {	//RedirectAttributes : 
	    log.info("[CONTROLLER]register : "+da);
	    service.register(da);
	    //rttr.addFlashAttribute("result",dept.getDeptcode());
	    //return "redirect:/dept/list";
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
	public String modify(DAVO da) {
	    log.info("[ CONTROLLER ] modify:" + da);
	    Date time = new Date();
	    da.setDaUpdateDate(time);
	    service.modify(da);
	    return "redirect:/DA/DA_list";
	}
	
	
	
	@GetMapping("/remove")
	public String remove(@RequestParam("daid") String daid) {
	    service.delete(daid);
	    return "redirect:/DA/DA_list";
	}
}
