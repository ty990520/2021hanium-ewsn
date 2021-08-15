package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.ControlledItemsVO;

public interface ControlledItemsMapper {
	public List<ControlledItemsVO> getList();
	public List<ControlledItemsVO> getCIDetailList(String number);
	public ControlledItemsVO read(String CI_detail_id);
	public void insert(ControlledItemsVO ci);	
	public int update(ControlledItemsVO ci);
}
