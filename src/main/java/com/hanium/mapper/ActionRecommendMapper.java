package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.ActionRecommendDTO;
import com.hanium.domain.ActionRecommendVO;
import com.hanium.domain.DAVO;


public interface ActionRecommendMapper {
	public List<ActionRecommendVO> getList();
	public List<ActionRecommendVO> getList_ac();
	public ActionRecommendVO read(Long AR_no);
	public ActionRecommendDTO read_DTO(Long Vul_id);
	public void insert(ActionRecommendVO ar_no);	
	public int update(ActionRecommendVO ar_no);	

}
