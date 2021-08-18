package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.DAVO;
import com.hanium.domain.ValTargetFacilityVO;


public interface ValTargetFacilityMapper {
	public List<ValTargetFacilityVO> getList();
	public ValTargetFacilityVO read(String Vul_targetId);
	public void insert(ValTargetFacilityVO vulfaciliy);	
	public int update(ValTargetFacilityVO vulfaciliy);
	public List<DAVO> targetDAList(int vul_id);
}
