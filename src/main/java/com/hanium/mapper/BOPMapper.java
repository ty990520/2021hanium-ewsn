package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.BOPVO;

public interface BOPMapper {
	public List<BOPVO> getList();
	public BOPVO read(Long bopNo);
	public void insert(BOPVO bop);	
	public int update(BOPVO bop);
	////리턴타입이 int인 이유는 제대로 작업이 처리된 경우 1을 리턴하는지 확인하기 위함!
}
