package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.IndirectVO;
import com.hanium.mapper.IndirectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class IndirectServiceImpl implements IndirectService{

	private IndirectMapper mapper;
	
	@Override
	public void register(IndirectVO ind) {
		mapper.insert(ind);
	}

	@Override
	public IndirectVO get(Long indirectNo) {
		return mapper.read(indirectNo);
	}

	@Override
	public boolean modify(IndirectVO ind) {
		return mapper.update(ind)==1;
	}

	@Override
	public List<IndirectVO> getList() {
		return mapper.getList();
	}

}
