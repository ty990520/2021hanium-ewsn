package com.hanium.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class BOPControllerTest {
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {
		log.info("[CONTROLLER]testList : "+mockMvc.perform(MockMvcRequestBuilders.get("/ActionRecommend/register_pre"))	//[CONTROLLER]testList :org.springframework.test.web.servlet.MockMvc$1@3aa41da1
				.andReturn()	//[CONTROLLER]testList : org.springframework.test.web.servlet.DefaultMvcResult@3c3c4a71
				.getModelAndView()	//[CONTROLLER]testList : ModelAndView [view="board/list"; model={list=[BoardVO(bno=1, title=테스트제목, content=테스트내용, writer=user00, regdate=Fri Jul 02 15:01:38 KST 2021, updateDate=Fri Jul 02 15:01:38 KST 2021), BoardVO(bno=2,  ...)]}]
				.getModelMap());	//[CONTROLLER]testList : {list=[BoardVO(bno=1, title=테스트제목, content=테스트내용, writer=user00, regdate=Fri Jul 02 15:01:38 KST 2021, updateDate=Fri Jul 02 15:01:38 KST 2021), BoardVO(bno=2, ...)]}
	}
	
	
}
