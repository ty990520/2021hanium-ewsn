package com.hanium.service;

import java.util.List;

import com.hanium.domain.RepresentCodeVO;

public interface RepresentCodeService {
	public void register(RepresentCodeVO rc);		//등록
	public RepresentCodeVO get(String R_code);			//부서 정보 조회
	public boolean modify(RepresentCodeVO rc);		//수정
	public List<RepresentCodeVO> getList();			//리스트 조회
}
