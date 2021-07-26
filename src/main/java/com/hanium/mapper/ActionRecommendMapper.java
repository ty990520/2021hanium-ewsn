package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.ActionRecommendVO;


public interface ActionRecommendMapper {
	public List<ActionRecommendVO> getList();
	public ActionRecommendVO read(Long AR_no);
	public void insert(ActionRecommendVO ar_no);	
	public int update(ActionRecommendVO ar_no);
}
