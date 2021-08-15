package com.hanium.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@SuppressWarnings("unused")
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RepresentCodeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private RepresentCodeMapper mapper5;


	@Test
	public void testRepresentCodeList() {
		//mapper5.getDeCodeList("PT01").forEach(i->log.info(i));
		//log.info(re.getR_code()+re.getR_codeName()+re.getD_code());
		log.info(mapper5.checkExistDecode("PT01", "PD01"));
	}

	
}