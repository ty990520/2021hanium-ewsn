package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.EmpVO;

public interface EmpMapper {
	public List<EmpVO> getList();
	public EmpVO read(String empid);
	public void insert(EmpVO emp);	
	public int update(EmpVO emp);
}
