package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.ActionImplementVO;


public interface ActionImplementMapper {
	public List<ActionImplementVO> getList();
	public ActionImplementVO read(Long AI_no);
	public void insert(ActionImplementVO ai_no);	
	public int update(ActionImplementVO ai_no);
}
