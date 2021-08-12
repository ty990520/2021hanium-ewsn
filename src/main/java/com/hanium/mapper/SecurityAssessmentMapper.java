package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.SecurityAssessDTO;
import com.hanium.domain.SecurityAssessmentVO;

public interface SecurityAssessmentMapper {
	public List<SecurityAssessDTO> getList();
	public List<SecurityAssessDTO> getListWithPaging(Criteria cri);
	public List<DAVO> identifyType_is_null();
	public List<DAVO> search_identifyType_is_null(Criteria cri);
	//public List<DAVO> identifyType_is_nullWithPaging(Criteria cri);
	public SecurityAssessmentVO read(Long SA_no);
	public SecurityAssessmentVO getSA_no(String SA_daID);
	public void insert(SecurityAssessmentVO sa);	
	public int update(SecurityAssessmentVO sa);
	public int count(Criteria cri);
	////리턴타입이 int인 이유는 제대로 작업이 처리된 경우 1을 리턴하는지 확인하기 위함!
}
