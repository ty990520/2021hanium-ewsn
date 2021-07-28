package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.DeptVO;
import com.hanium.mapper.DeptMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DeptServiceImpl implements DeptService{

	private DeptMapper mapper;
	
	@Override
	public void register(DeptVO dept) {
		log.info("[SERVICE]register..."+dept);
		mapper.insert(dept);
	}

	@Override
	public DeptVO get(String deptcode) {
		log.info("[SERVICE]get..."+deptcode);
		return mapper.read(deptcode);
	}

	@Override
	public boolean modify(DeptVO dept) {
		log.info("[SERVICE]modify..."+dept);
		return mapper.update(dept)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<DeptVO> getList() {
		log.info("[SERVICE]getList...");
		return mapper.getList();
	}

	@Override
	public List<String> getDeptList() {
		return mapper.getDept();
	}

}
