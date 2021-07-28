package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.DeptVO;

public interface DeptMapper {
	public List<DeptVO> getList();
	public List<String> getDept();
	public DeptVO read(String deptcode);
	public void insert(DeptVO dept);	
	public int update(DeptVO dept);
	////리턴타입이 int인 이유는 제대로 작업이 처리된 경우 1을 리턴하는지 확인하기 위함!
}
