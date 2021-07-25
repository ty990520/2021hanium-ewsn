package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.EPVO;
import com.hanium.mapper.EPMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EPServiceImpl implements EPService{

	private EPMapper mapper;
	
	@Override
	public void register(EPVO ep) {
		mapper.insert(ep);
	}

	@Override
	public EPVO get(Long epNo) {
		return mapper.read(epNo);
	}

	@Override
	public boolean modify(EPVO ep) {
		return mapper.update(ep)==1;
	}

	@Override
	public List<EPVO> getList() {
		return mapper.getList();
	}

}
