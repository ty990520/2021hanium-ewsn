package com.hanium.service;

import java.util.List;

import com.hanium.domain.EmpVO;

public interface EmpService {
	public void register(EmpVO emp);		//등록
	public EmpVO get(String empid);			//글 조회
	public boolean modify(EmpVO emp);		//수정
	public List<EmpVO> getList();	
}
