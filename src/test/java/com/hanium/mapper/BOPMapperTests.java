package com.hanium.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hanium.domain.BOPVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BOPMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BOPMapper mapper;
	
	@Test
	public void testInsert() {
	    BOPVO bop = new BOPVO();

	    bop.setBopAdverseEffectsContent("---TEST---");
	    bop.setBopDeepProtectiContent("---TEST---");
	    bop.setBopPlantStatusInfo("---TEST---");
	    bop.setBopPowergenStop("---TEST---");
	    bop.setBopSA_no(1L);
	    mapper.insert(bop);

	    log.info(bop);
	}
}
