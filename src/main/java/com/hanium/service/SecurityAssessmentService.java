package com.hanium.service;

import java.util.List;

import com.hanium.domain.SecurityAssessDTO;
import com.hanium.domain.SecurityAssessmentVO;

public interface SecurityAssessmentService {
	public void register(SecurityAssessmentVO sa);		//등록
	public SecurityAssessmentVO get(Long SA_no);			//부서 정보 조회
	public boolean modify(SecurityAssessmentVO sa);		//수정
	public List<SecurityAssessDTO> getList();			//리스트 조회
}
