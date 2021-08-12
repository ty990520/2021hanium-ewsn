package com.hanium.service;

import java.util.List;

import com.hanium.domain.BOPVO;
import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.EPVO;
import com.hanium.domain.IndirectVO;
import com.hanium.domain.SecurityAssessDTO;
import com.hanium.domain.SecurityAssessmentVO;

public interface SecurityAssessmentService {
	public void register(SecurityAssessmentVO sa);		//등록
	public SecurityAssessmentVO get(Long SA_no);			//부서 정보 조회
	public SecurityAssessmentVO getSA_no(String SA_daID);	
	public boolean modify(SecurityAssessmentVO sa);		//수정
	public List<SecurityAssessDTO> getList(Criteria cri);			//리스트 조회

	public List<DAVO> necessaryList();
	public List<DAVO> search_necessaryList(Criteria cri);
	public boolean registerEP(SecurityAssessmentVO sa, EPVO ep);
	public boolean registerBOP(SecurityAssessmentVO sa, BOPVO bop);
	public boolean registerIndirect(SecurityAssessmentVO sa, IndirectVO ind);
	public int count(Criteria cri);
}
