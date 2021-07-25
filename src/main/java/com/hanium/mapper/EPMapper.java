package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.EPVO;

public interface EPMapper {
	public List<EPVO> getList();
	public EPVO read(Long epNo);
	public void insert(EPVO ep);	
	public int update(EPVO ep);
	////리턴타입이 int인 이유는 제대로 작업이 처리된 경우 1을 리턴하는지 확인하기 위함!
}
