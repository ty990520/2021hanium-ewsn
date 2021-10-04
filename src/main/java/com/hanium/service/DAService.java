package com.hanium.service;

import java.util.List;

import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;

public interface DAService {
	public void register(DAVO da);		//등록
	public DAVO get(String daid);			//글 조회
	public boolean modify(DAVO da);		//수정
	public boolean updateIdentifyType(String daIdentifyType, String daid);
	public List<DAVO> getList(Criteria cri);	
	public int count(Criteria cri);
	public boolean delete(String daid);	// 구현 ->Impl.jsva 에서 
	public int seq();
	public List<String> modelList();	
	public List<String> manufacturerList();	
	public List<DAVO> getVulTargetList_CI(String daManufacturer, String daModel, String daSystemSW, int vul_id);

}
