
package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain. ControlledItemsApplyVO;
import com.hanium.mapper. ControlledItemsApplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ControlledItemsApplyServiceImpl implements  ControlledItemsApplyService{

	private  ControlledItemsApplyMapper mapper;
	
	@Override
	public void register( ControlledItemsApplyVO cia) {
		mapper.insert(cia);
	}

	@Override
	public  ControlledItemsApplyVO get(Long CI_apply_no) {
		return mapper.read(CI_apply_no);
	}

	@Override
	public boolean modify( ControlledItemsApplyVO cia) {
		return mapper.update(cia)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List< ControlledItemsApplyVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<ControlledItemsApplyVO> get(String CI_daID, String CI_applyDetail_id) {
		return mapper.get(CI_daID, CI_applyDetail_id);
	}



}
