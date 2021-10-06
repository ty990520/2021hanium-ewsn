package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.ControlledItemsVO;

public interface ControlledItemsMapper {
	public List<ControlledItemsVO> getList();
	public List<ControlledItemsVO> getList_detailType();
	public List<ControlledItemsVO> getCIDetailList(String number);
	public ControlledItemsVO read(String CI_detail_id);
	public void insert(ControlledItemsVO ci);	
	public int update(ControlledItemsVO ci);
	public List<ControlledItemsVO> type(String type);
	public int detail_id_count(@Param("CI_detail_id") String CI_detail_id);
}
