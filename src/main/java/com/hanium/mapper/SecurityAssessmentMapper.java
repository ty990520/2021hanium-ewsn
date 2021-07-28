package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.SecurityAssessDTO;
import com.hanium.domain.SecurityAssessmentVO;

public interface SecurityAssessmentMapper {
	public List<SecurityAssessDTO> getList();
	public SecurityAssessmentVO read(Long SA_no);
	public void insert(SecurityAssessmentVO sa);	
	public int update(SecurityAssessmentVO sa);
	////리턴타입이 int인 이유는 제대로 작업이 처리된 경우 1을 리턴하는지 확인하기 위함!
}
