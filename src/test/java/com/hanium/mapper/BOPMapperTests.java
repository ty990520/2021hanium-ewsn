package com.hanium.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hanium.domain.ActionVO;
import com.hanium.domain.BOPVO;
import com.hanium.domain.EPVO;
import com.hanium.domain.EmpVO;
import com.hanium.domain.IndirectVO;
import com.hanium.domain.UserVO;

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

	@Setter(onMethod_ = @Autowired)
	private IndirectMapper mapper3;
	
	@Setter(onMethod_ = @Autowired)
	private EmpMapper mapper4;
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper5;
	
	@Setter(onMethod_ = @Autowired)
	private ActionMapper mapper7;
	
	@Setter(onMethod_ = @Autowired)
	private ActionRecommendMapper mapper8;
	

	
	@Test
	public void testGetUser() {
		BOPVO bop = mapper.read(5L); // 원하는 bno값을 입력함, 임의로 bno = 5라고 가정
		log.info(bop.getBopPlantStatusInfo());
	}

	
	@Test
	public void testInsert() {
		BOPVO bop = new BOPVO();

		bop.setBopAdverseEffectsContent("---TEST---");
		bop.setBopDeepProtectiContent("---TEST---");
		bop.setBopPlantStatusInfo("---TEST---");
		bop.setBopPowergenStop("---TEST---");
		//bop.setBopSA_no(1L);
		mapper.insert(bop);

		log.info(bop);
	}

	@Test
	public void testInsert2() {
		EPVO ep = new EPVO();
		//ep.setEpNo("H03-F391");
		ep.setEpAlterContent("----TEST----");
		ep.setEpAlterDoc("----TEST----");
		ep.setEpAlterTypeComment("----TEST----");
		ep.setEpDmgDetMContent("----TEST----");
		ep.setEpDmgDoc("----TEST----");
		ep.setEpETContent("----TEST----");
		ep.setEpETDoc("----TEST----");
		mapper2.insert(ep);

		log.info(ep);
	}

	@Test
	public void testInsert3() {
		IndirectVO ind = new IndirectVO();

		ind.setIndDmgDetectASContent("----TEST----");
		ind.setIndDmgDetectASDoc("----TEST----");
		ind.setIndDmgDetectContent("----TEST----");
		ind.setIndDmgDetectDoc("----TEST----");
		ind.setIndETContent("----TEST----");
		ind.setIndETDoc("----TEST----");
		ind.setIndIWAlterContent("----TEST----");
		ind.setIndIWPerformContent("----TEST----");
		//ind.setIndSA_no(5L);

		mapper3.insert(ind);

		log.info(ind);
	}
	
	@Test
	public void testInsert4() {
		EmpVO emp = new EmpVO();

		emp.setEmpDeptCode("AA01");
		emp.setEmpid("AA01-210724");
		
		mapper4.insert(emp);

		log.info(emp);
	}
	
	@Test
	public void testInsert5() {
		UserVO user = new UserVO();

		user.setUserid("AA01-210724");
		user.setUserptype("원자력");
		user.setUserdept("관리자그룹");
		user.setUsername("박태영");
		user.setUserpw("12341234");
		user.setUseremail("ty990520@naver.com");
		
		mapper5.insert(user);

		log.info(user);
	}
	
	@Test
	public void testInsert7() {
		ActionVO ac = new ActionVO();

		ac.setAC_no(1L);
		
		mapper7.insert(ac);

		log.info(ac);
	}
}
