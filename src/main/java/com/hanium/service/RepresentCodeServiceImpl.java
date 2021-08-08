package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.RepresentCodeVO;
import com.hanium.mapper.RepresentCodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RepresentCodeServiceImpl implements RepresentCodeService{

	private RepresentCodeMapper mapper;
	
	@Override
	public void register(RepresentCodeVO re) {
		mapper.insert(re);
	}

	@Override
	public RepresentCodeVO get(String R_code) {
		return mapper.read(R_code);
	}

	@Override
	public boolean modify(RepresentCodeVO re) {
		return mapper.update(re)==1;
	}

	@Override
	public List<RepresentCodeVO> getList() {
		return mapper.getList();
	}

}
