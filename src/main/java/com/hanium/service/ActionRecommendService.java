package com.hanium.service;

import java.util.List;

import com.hanium.domain.ActionRecommendDTO;
import com.hanium.domain.ActionRecommendVO;


public interface ActionRecommendService {
	public void register(ActionRecommendVO ar);		//등록
	public ActionRecommendVO get(Long AR_no);			//글 조회
	public boolean modify(ActionRecommendVO ar);		//수정
	public List<ActionRecommendVO> getList();			//리스트 조회
	public List<ActionRecommendVO> getList_ac();			//리스트 조회
	public ActionRecommendDTO get_dto(Long Vul_id);			//글 조회
}
