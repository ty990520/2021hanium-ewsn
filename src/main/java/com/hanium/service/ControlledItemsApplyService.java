package com.hanium.service;

import java.util.List;

import com.hanium.domain.ControlledItemsApplyVO;

public interface ControlledItemsApplyService {
	public void register(ControlledItemsApplyVO cia);		//등록
	public ControlledItemsApplyVO get(Long CI_apply_no);			//글 조회
	public boolean modify(ControlledItemsApplyVO cia);		//수정
	public List<ControlledItemsApplyVO> getList();		
	//리스트 조회
	public List<ControlledItemsApplyVO> getCI(Long ci_version_no);		
	public int count();
}
