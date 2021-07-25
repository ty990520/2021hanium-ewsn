package com.hanium.service;

import java.util.List;

import com.hanium.domain.EPVO;

public interface EPService {
	public void register(EPVO ep);		//등록
	public EPVO get(Long epNo);			//글 조회
	public boolean modify(EPVO ep);		//수정
	public List<EPVO> getList();			//리스트 조회
}
