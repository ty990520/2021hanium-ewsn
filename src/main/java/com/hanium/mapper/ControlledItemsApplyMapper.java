package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.ControlledItemsApplyVO;

public interface ControlledItemsApplyMapper {

	public List<ControlledItemsApplyVO> getList();
	public ControlledItemsApplyVO read(Long CI_apply_no);
	public void insert(ControlledItemsApplyVO cia);	
	public int update(ControlledItemsApplyVO cia);
}
