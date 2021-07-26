package com.hanium.service;

import java.util.List;

import com.hanium.domain.ActionImplementVO;

public interface ActionImplementService {
	public void register(ActionImplementVO ai);		//등록
	public ActionImplementVO get(Long AI_no);			//글 조회
	public boolean modify(ActionImplementVO ai);		//수정
	public List<ActionImplementVO> getList();			//리스트 조회
}
