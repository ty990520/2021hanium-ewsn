
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
	public int count() {
		return mapper.count();
	}

	@Override
	public List<ControlledItemsApplyVO> getCI(Long ci_version_no) {
		log.info("[service] "+ci_version_no);
		return mapper.getCI(ci_version_no);
	}



}
