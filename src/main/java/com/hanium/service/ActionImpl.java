package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.hanium.domain.ActionVO;
import com.hanium.mapper.ActionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ActionImpl implements ActionService{
	private  ActionMapper mapper;
	@Override
	public void register(ActionVO ac) {
		mapper.insert(ac);
	}

	@Override
	public ActionVO get(Long AC_no) {
		return mapper.read(AC_no);
	}

	@Override
	public boolean modify(ActionVO ac) {
		return mapper.update(ac)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<ActionVO> getList() {
		return mapper.getList();
	}
}
