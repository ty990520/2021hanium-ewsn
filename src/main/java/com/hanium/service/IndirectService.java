package com.hanium.service;

import java.util.List;

import com.hanium.domain.IndirectVO;

public interface IndirectService {
	public void register(IndirectVO ind);		//등록
	public IndirectVO get(Long indirectNo);			//글 조회
	public boolean modify(IndirectVO ind);		//수정
	public List<IndirectVO> getList();	
}
