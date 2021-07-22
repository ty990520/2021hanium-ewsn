package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.BOPVO;
import com.hanium.mapper.BOPMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BOPServiceImpl implements BOPService{

	private BOPMapper mapper;
	
	@Override
	public void register(BOPVO bop) {
		mapper.insert(bop);
	}

	@Override
	public BOPVO get(Long bopNo) {
		return mapper.read(bopNo);
	}

	@Override
	public boolean modify(BOPVO bop) {
		return mapper.update(bop)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<BOPVO> getList() {
		return mapper.getList();
	}

}
