package com.hanium.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hanium.domain.BOPVO;
import com.hanium.domain.EPVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BOPMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BOPMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private EPMapper mapper2;
	
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
	
	@Test
	public void testInsert2() {
	    EPVO ep = new EPVO();

	    ep.setEpAlterContent("----TEST----");
	    ep.setEpAlterDoc("----TEST----");
	    ep.setEpAlterTypeComment("----TEST----");
	    ep.setEpDmgDetMContent("----TEST----");
	    ep.setEpDmgDoc("----TEST----");
	    ep.setEpETContent("----TEST----");
	    ep.setEpETDoc("----TEST----");
	    ep.setEpSA_no(4L);
	    mapper2.insert(ep);

	    log.info(ep);
	}
}
