package com.hanium.service;

import java.util.List;

import com.hanium.domain.DAVO;

public interface DAService {
	public void register(DAVO da);		//등록
	public DAVO get(String daid);			//글 조회
	public boolean modify(DAVO da);		//수정
	public List<DAVO> getList();			//리스트 조회
}
