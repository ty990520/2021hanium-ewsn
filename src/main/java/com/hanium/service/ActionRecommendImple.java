package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.ActionRecommendDTO;
import com.hanium.domain.ActionRecommendVO;
import com.hanium.mapper.ActionRecommendMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ActionRecommendImple implements ActionRecommendService {
	private  ActionRecommendMapper mapper;
	
	@Override
	public void register(ActionRecommendVO ar) {
		mapper.insert(ar);
	}

	@Override
	public ActionRecommendVO get(Long AR_no) {
		return mapper.read(AR_no);
	}

	@Override
	public boolean modify(ActionRecommendVO ar) {
		return mapper.update(ar)==1;	//update()의 반환형은 int이기 때문에!
	}

	@Override
	public List<ActionRecommendVO> getList() {
		return mapper.getList();
	}
	@Override
	public List<ActionRecommendVO> getList_ac() {
		return mapper.getList_ac();
	}
	public ActionRecommendDTO get_dto(Long vul) {
		 return mapper.read_DTO(vul);
	}
}
