package com.hanium.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hanium.domain.DeptVO;
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

	@Test
	public void testGetList() {
		mapper.getList().forEach(dept -> log.info(dept.getDeptcode()));
	}
	
	@Test
	public void testRead() {
	    DeptVO dept = mapper.read("AA01");	// 원하는 bno값을 입력함, 임의로 bno = 5라고 가정
	    log.info(dept.getDeptptype() +" "+ dept.getDeptname());
	}
	
	@Test
	public void testInsert() {
		DeptVO dept = new DeptVO();
		dept.setDeptcode("AA02");
		dept.setDeptname("사이버보안 담당 그룹");
		dept.setDeptptype("원자력");

	    mapper.insert(dept);

	    log.info(dept.getDeptcode()+":"+dept.getDeptptype()+":"+dept.getDeptname());
	}
	
	@Test
	public void testUpdate() {
		DeptVO dept = new DeptVO();

	    // 실행 전 존재하는 번호인지 확인할 것!
		dept.setDeptcode("AA02");
		dept.setDeptname("사이버보안 담당 그룹");
		dept.setDeptptype("원자력");

	    log.info("UPDATE COUNT : "+mapper.update(dept));
	    //정상적으로 update되었으면 1을 반환함
	}
	
	@Test
	public void testValidUpdate() {
		UserVO user = new UserVO();

	    // 실행 전 존재하는 번호인지 확인할 것!
		user.setUserid("AA02-210725");

	    log.info("UPDATE COUNT : "+mapper2.userValidityCheck(user));
	    //정상적으로 update되었으면 1을 반환함
	}
}