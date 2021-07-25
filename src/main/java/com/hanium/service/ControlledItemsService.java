package com.hanium.service;

import java.util.List;

import com.hanium.domain.ControlledItemsVO;

public interface ControlledItemsService {
	public void register(ControlledItemsVO ci);		//등록
	public ControlledItemsVO get(String CI_detail_id);			//글 조회
	public boolean modify(ControlledItemsVO ci);		//수정
	public List<ControlledItemsVO> getList();			//리스트 조회
}
