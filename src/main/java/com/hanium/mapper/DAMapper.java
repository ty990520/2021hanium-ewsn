package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.DAVO;

public interface DAMapper {
	public List<DAVO> getList();
	public DAVO read(String daid);
	public void insert(DAVO da);	
	public int update(DAVO da);
}
