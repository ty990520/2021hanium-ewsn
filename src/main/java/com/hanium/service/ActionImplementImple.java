package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.ActionImplementVO;
import com.hanium.mapper.ActionImplementMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ActionImplementImple implements ActionImplementService  {
	private  ActionImplementMapper mapper;
	
	@Override
	public void register(ActionImplementVO ai) {
		mapper.insert(ai);
	}

	@Override
	public ActionImplementVO get(Long AI_no) {
		return mapper.read(AI_no);
	}

	@Override
	public boolean modify(ActionImplementVO ai) {
		return mapper.update(ai)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<ActionImplementVO> getList() {
		return mapper.getList();
	}
}
