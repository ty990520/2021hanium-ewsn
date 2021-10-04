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
import com.hanium.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private SecurityAssessmentMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private DAMapper mapper2;
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper3;
	
	@Setter(onMethod_ = @Autowired)
	private ControlledItemsMapper mapper4;
	
	@Setter(onMethod_ = @Autowired)
	private ControlledItemsApplyMapper mapper5;
	
	@Test
	public void testCIA() {
		//List<DAVO> da_list = mapper2.getVulTargetList_CI("우리기술", "WTG-PMS", "Firmware");
		//da_list.forEach(i->log.info(i));
	}
	
	/*@Test
	public void testCIA() {
		List<ControlledItemsApplyVO> cia = mapper5.getCI("0");
		cia.forEach(i->log.info(i));
	}*/
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//PageDTO page = new PageDTO(cri, 0);
		
		cri.setPageNum(2);
		cri.setAmount(10);
		
		log.info(cri.getStartIndex());
		log.info(cri.getEndIndex());
		
		log.info("[count] "+mapper.count(cri));
		List<SecurityAssessDTO> list = mapper.getListWithPaging(cri);
		list.forEach(li->log.info(li));
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("1");
		cri.setType("I");
		List<UserVO> list = mapper3.getAdminRequest(cri);
		list.forEach(da -> log.info(da));
	}

	@Test
	public void testControlledItemslist() {
		mapper4.getCIDetailList("1.").forEach(dept -> log.info(dept));
	}
}
