package com.hanium.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BOPServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private BOPService service;
	
	@Setter(onMethod_ = {@Autowired})
	private SecurityAssessmentService service2;
	
	@Setter(onMethod_ = {@Autowired})
	private EmpService service3;
	
	@Setter(onMethod_ = {@Autowired})
	private UserService userservice;
	
	@Setter(onMethod_ = {@Autowired})
	private ControlledItemsApplyService ciaservice;
	
	@Test
	public void testExist() {
		log.info(userservice);
		assertNotNull(userservice);	//null이 아님을 시험
	}
	
	/*@Test
	public void ciaTest() {
		Long ci_version_no=(long) 0;
		List<ControlledItemsApplyVO> cia = ciaservice.getCI(ci_version_no);
		cia.forEach(i->log.info(i));
		
	}*/
}
