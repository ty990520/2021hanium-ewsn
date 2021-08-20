package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.DAVO;
import com.hanium.domain.ValTargetFacilityVO;
import com.hanium.mapper.ValTargetFacilityMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ValTargetFacilityImple implements ValTargetFacilityService {
	private  ValTargetFacilityMapper mapper;
	
	@Override
	public void register(ValTargetFacilityVO vulfacility) {
		mapper.insert(vulfacility);
	}

	@Override
	public ValTargetFacilityVO get(String Vul_targetId) {
		return mapper.read(Vul_targetId);
	}

	@Override
	public boolean modify(ValTargetFacilityVO vulfacility) {
		return mapper.update(vulfacility)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<ValTargetFacilityVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<DAVO> targetDAList(int vul_id) {
		return mapper.targetDAList(vul_id);
	}
}
