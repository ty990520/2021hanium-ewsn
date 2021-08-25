package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.ControlledItemsApplyVO;

public interface ControlledItemsApplyMapper {

	public List<ControlledItemsApplyVO> getList();
	public ControlledItemsApplyVO read(Long CI_apply_no);
	public void insert(ControlledItemsApplyVO cia);	
	public int update(ControlledItemsApplyVO cia);
	public List<ControlledItemsApplyVO> getCI(@Param("ci_version_no") Long ci_version_no);
	public int count();
}
