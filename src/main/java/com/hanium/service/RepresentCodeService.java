package com.hanium.service;

import java.util.List;

import com.hanium.domain.RepresentCodeVO;

public interface RepresentCodeService {
	public void register(RepresentCodeVO re);		//등록
	public RepresentCodeVO get(Long represent_id);			//부서 정보 조회
	public boolean modify(RepresentCodeVO re);		//수정
	public List<RepresentCodeVO> getList();			//리스트 조회
	public List<RepresentCodeVO> getReCodeList();			//리스트 조회
	public List<RepresentCodeVO> getDeCodeList(String R_code);			//리스트 조회
	public boolean checkExistRecode(String R_code);
	public boolean checkExistDecode(String R_code, String D_code);
}
