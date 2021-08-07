package com.hanium.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hanium.domain.Criteria;
import com.hanium.domain.SecurityAssessDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private SecurityAssessmentMapper mapper;
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//PageDTO page = new PageDTO(cri, 0);
		
		cri.setPageNum(2);
		cri.setAmount(10);
		
		log.info(cri.getStartIndex());
		log.info(cri.getEndIndex());
		
		List<SecurityAssessDTO> list = mapper.getListWithPaging(cri);
		list.forEach(li->log.info(li));
	}
	
}
