package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.EmpVO;
import com.hanium.mapper.EmpMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EmpServiceImpl implements EmpService{

	private EmpMapper mapper;
	@Override
	public void register(EmpVO emp) {
		mapper.insert(emp);
	}

	@Override
	public EmpVO get(String empid) {
		return mapper.read(empid);
	}

	@Override
	public boolean modify(EmpVO emp) {
		return mapper.update(emp)==1;
	}

	@Override
	public List<EmpVO> getList() {
		return mapper.getList();
	}

}
