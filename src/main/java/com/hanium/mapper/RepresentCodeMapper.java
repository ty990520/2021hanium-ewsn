package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.RepresentCodeVO;

public interface RepresentCodeMapper{
	public List<RepresentCodeVO> getList();
	public RepresentCodeVO read(String R_code);
	public void insert(RepresentCodeVO re);	
	public int update(RepresentCodeVO re);
}
