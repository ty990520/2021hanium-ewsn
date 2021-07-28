package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.ControlledItemsVO;
import com.hanium.mapper.ControlledItemsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ControlledItemsServiceImpl implements ControlledItemsService{

	private ControlledItemsMapper mapper;
	@Override
	public void register(ControlledItemsVO ci) {
		mapper.insert(ci);
	}

	@Override
	public ControlledItemsVO get(String CI_detail_id) {
		return mapper.read(CI_detail_id);
	}

	@Override
	public boolean modify(ControlledItemsVO ci) {
		return mapper.update(ci)==1;
	}

	@Override
	public List<ControlledItemsVO> getList() {
		return mapper.getList();
	}

}