package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.IndirectVO;

public interface IndirectMapper {
	public List<IndirectVO> getList();
	public IndirectVO read(Long indirectNo);
	public void insert(IndirectVO ind);	
	public int update(IndirectVO ind);
}
