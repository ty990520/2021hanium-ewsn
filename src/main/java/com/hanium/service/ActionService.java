package com.hanium.service;

import java.util.List;

import com.hanium.domain.ActionVO;

public interface ActionService {
	public void register(ActionVO ac);		//등록
	public ActionVO get(Long AC_no);			//글 조회
	public boolean modify(ActionVO ac);		//수정
	public List<ActionVO> getList();	
}
