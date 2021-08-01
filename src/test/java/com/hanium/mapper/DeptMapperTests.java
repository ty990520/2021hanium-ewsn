package com.hanium.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hanium.domain.DeptVO;
import com.hanium.domain.EPVO;
import com.hanium.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DeptMapperTests {
	@Setter(onMethod_ = @Autowired)
	private DeptMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper2;
	
	@Setter(onMethod_ = @Autowired)
	private SecurityAssessmentMapper mapper3;
	
	@Setter(onMethod_ = @Autowired)
	private EPMapper mapper4;

	@Test
	public void testGetList() {
		mapper.getDept().forEach(dept -> log.info(dept));
	}
	
	@Test
	public void testSAlist() {
		mapper3.getList().forEach(dept -> log.info(dept));
	}

	@Test
	public void testEPList() {
		EPVO ep = mapper4.read(4L);
		log.info(ep.getEpAlterContent());
	}
	
	@Test
	public void testGetUser() {
		UserVO user = mapper2.get("11111"); // 원하는 bno값을 입력함, 임의로 bno = 5라고 가정
		log.info(user.getUsername());
	}

	@Test
	public void testRead() {
		DeptVO dept = mapper.read("AA01"); // 원하는 bno값을 입력함, 임의로 bno = 5라고 가정
		log.info(dept.getDeptptype() + " " + dept.getDeptname());
	}
	
	@Test
	public void testInsert() {
		DeptVO dept = new DeptVO();
		dept.setDeptcode("AA02");
		dept.setDeptname("사이버보안 담당 그룹");
		dept.setDeptptype("원자력");

		mapper.insert(dept);

		log.info(dept.getDeptcode() + ":" + dept.getDeptptype() + ":" + dept.getDeptname());
	}

	@Test
	public void testUpdate() {
		DeptVO dept = new DeptVO();

		// 실행 전 존재하는 번호인지 확인할 것!
		dept.setDeptcode("AA02");
		dept.setDeptname("사이버보안 담당 그룹");
		dept.setDeptptype("원자력");

		log.info("UPDATE COUNT : " + mapper.update(dept));
		// 정상적으로 update되었으면 1을 반환함
	}

	@Test
	public void testUpdateDept() {
		log.info("UPDATE COUNT : " + mapper2.updateDept("원자력", "사이버보안 담당 그룹", "2222"));
		// 정상적으로 update되었으면 1을 반환함
	}
	
	@Test
	public void testValidUpdate() {
		//UserVO user = mapper2.read("AA02-210725");
		UserVO user = mapper2.findUserValidity("222-210725");
		//log.info(user.getUserid());
		if(user==null) {
			log.info("null");
		}
		else
			log.info(user.getUserid());
		// 실행 전 존재하는 번호인지 확인할 것!
		//log.info(mapper2.findUserValidity("AA02-210725"));
		//log.info(mapper2.findUserValidity().toString());
		// log.info("UPDATE COUNT : "+mapper2.userValidityCheck(user));
		// 정상적으로 update되었으면 1을 반환함
	}
	
	
	
	@Test
	public void testLogin(){
		UserVO user = mapper2.login("AA02-210725", "2222");
		log.info(user);
		
		
	}
}