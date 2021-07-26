package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.ActionVO;


public interface ActionMapper {
	public List<ActionVO> getList();
	public ActionVO read(Long AC_no);
	public void insert(ActionVO ac_no);	
	public int update(ActionVO ac_no);
}
