package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;

public interface DAMapper {
	public List<DAVO> getList();
	public List<DAVO> getListWithPaging(Criteria cri);
	public List<DAVO> getVulTargetList_CI(@Param("daManufacturer") String daManufacturer
			,@Param("daModel") String daModel,@Param("daSystemSW") String daSystemSW, @Param("vul_id") int vul_id);
	public DAVO read(String daid);
	public void insert(DAVO da);	
	public int update(DAVO da);
	public int updateIdentifyType(@Param("daIdentifyType") String daIdentifyType,@Param("daid") String daid);
	public int count(Criteria cri);
	public int delete(String daid);
	public int seq();
	public List<String> modelList();
	public List<String> manufacturerList();
}
