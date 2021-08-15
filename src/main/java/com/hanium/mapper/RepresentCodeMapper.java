package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.RepresentCodeVO;

public interface RepresentCodeMapper{
	public List<RepresentCodeVO> getList();
	public List<RepresentCodeVO> getReCodeList();	//대표코드 출력
	public List<RepresentCodeVO> getDeCodeList(String R_code);	//상세코드 출력
	public int checkExistRecode(String R_code);
	public int checkExistDecode(@Param("R_code") String R_code, @Param("D_code") String D_code);
	public RepresentCodeVO read(Long represent_id);
	public void insert(RepresentCodeVO re);	
	public int update(RepresentCodeVO re);
}
