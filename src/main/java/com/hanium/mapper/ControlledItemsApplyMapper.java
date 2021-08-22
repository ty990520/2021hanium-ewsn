package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.ControlledItemsApplyVO;

public interface ControlledItemsApplyMapper {

	public List<ControlledItemsApplyVO> getList();
	public ControlledItemsApplyVO read(Long CI_apply_no);
	public void insert(ControlledItemsApplyVO cia);	
	public int update(ControlledItemsApplyVO cia);
	public List<ControlledItemsApplyVO> get(@Param("CI_daID") String CI_daID,@Param("CI_applyDetail_id") String CI_applyDetail_id);
}
