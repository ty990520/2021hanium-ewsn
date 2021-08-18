package com.hanium.service;

import java.util.List;

import com.hanium.domain.DAVO;
import com.hanium.domain.ValTargetFacilityVO;

public interface ValTargetFacilityService {
	public void register(ValTargetFacilityVO vulfacility);		//등록
	public ValTargetFacilityVO get(String Vul_targetId);			//글 조회
	public boolean modify(ValTargetFacilityVO vulfacility);		//수정
	public List<ValTargetFacilityVO> getList();			//리스트 조회
	public List<DAVO> targetDAList(int vul_id);
}
