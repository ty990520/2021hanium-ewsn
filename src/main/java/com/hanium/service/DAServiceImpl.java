package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.DAVO;
import com.hanium.mapper.DAMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DAServiceImpl implements DAService{

	private DAMapper mapper;
	
	@Override
	public void register(DAVO da) {
		mapper.insert(da);
	}

	@Override
	public DAVO get(String daid) {
		return mapper.read(daid);
	}

	@Override
	public boolean modify(DAVO da) {
		return mapper.update(da)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<DAVO> getList() {
		return mapper.getList();
	}

	@Override
	public boolean updateIdentifyType(String daIdentifyType, String daid) {
		return mapper.updateIdentifyType(daIdentifyType, daid)==1;
	}

}
