package com.hanium.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hanium.domain.DeptVO;
import com.hanium.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DeptServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private DeptService service;
	
	@Setter(onMethod_ = {@Autowired})
	private UserService service2;
	
	@Setter(onMethod_ = {@Autowired})
	private RepresentCodeService service3;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);	//null이 아님을 시험
	}//의존성 주입이 잘 되었는지 확인하는 코드임
	
	
	
	@Test
	public void testRegister() {
		DeptVO dept = new DeptVO();
		dept.setDeptcode("AA03");
		dept.setDeptname("설비담당 그룹");
		dept.setDeptptype("원자력");
		
	    service.register(dept);
	    log.info("생성된 게시물의 번호: " + dept.getDeptcode());
	}
	
	@Test // 리스트 조회
	public void testGetList() {
		service.getList().forEach(dept -> log.info(dept));
	}

	@Test // 리스트 조회
	public void testRecodeList() {
		log.info(service3.checkExistRecode("PT01"));
	}
	
	@Test // 부서코드로 부서 정보 조회
	public void testGet() {
		log.info(service.get("AA01"));
	}

	@Test	//글 수정
	public void testUpdate() {
		DeptVO dept = service.get("AA01");
		if (dept == null) {
			return;
		}
		dept.setDeptptype("화력");
		log.info("MODIFY RESULT: " + service.modify(dept));
	}
	
	@Test	//글 수정
	public void testValidUpdate() {
		UserVO user = service2.get("AA02-210725");
		if (user == null) {
			return;
		}
		log.info("MODIFY RESULT: " + service2.setUserValid(user));
	}
	
	@Test
	public void testlogin() {
		log.info(service2.login("AA02-210725", "1222"));
	}
}
