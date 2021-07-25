package com.hanium.service;

import java.util.List;

import com.hanium.domain.BOPVO;

public interface BOPService {
	public void register(BOPVO bop);		//등록
	public BOPVO get(Long bopNo);			//글 조회
	public boolean modify(BOPVO bop);		//수정
	public List<BOPVO> getList();			//리스트 조회
}
