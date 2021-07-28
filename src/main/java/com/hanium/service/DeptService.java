package com.hanium.service;

import java.util.List;

import com.hanium.domain.DeptVO;

public interface DeptService {
	public void register(DeptVO dept);		//등록
	public DeptVO get(String deptcode);			//부서 정보 조회
	public boolean modify(DeptVO dept);		//수정
	public List<DeptVO> getList();			//리스트 조회
	public List<String> getDeptList();
}
