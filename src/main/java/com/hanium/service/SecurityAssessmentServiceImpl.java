package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hanium.domain.BOPVO;
import com.hanium.domain.Criteria;
import com.hanium.domain.DAVO;
import com.hanium.domain.EPVO;
import com.hanium.domain.IndirectVO;
import com.hanium.domain.SecurityAssessDTO;
import com.hanium.domain.SecurityAssessmentVO;
import com.hanium.mapper.BOPMapper;
import com.hanium.mapper.DAMapper;
import com.hanium.mapper.EPMapper;
import com.hanium.mapper.IndirectMapper;
import com.hanium.mapper.SecurityAssessmentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SecurityAssessmentServiceImpl implements SecurityAssessmentService {

	private SecurityAssessmentMapper mapper;
	private DAMapper mapper_DA;
	private EPMapper mapper_ep;
	private BOPMapper mapper_bop;
	private IndirectMapper mapper_ind;

	@Override
	public void register(SecurityAssessmentVO sa) {
		mapper.insert(sa);
	}

	@Override
	public SecurityAssessmentVO get(Long SA_no) {
		return mapper.read(SA_no);
	}

	@Override
	public boolean modify(SecurityAssessmentVO sa) {
		return mapper.update(sa) == 1;
	}

	@Override
	public List<SecurityAssessDTO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<DAVO> necessaryList() {
		return mapper.identifyType_is_null();
	}

	@Override
	public SecurityAssessmentVO getSA_no(String SA_daID) {
		return mapper.getSA_no(SA_daID);
	}

	@Transactional
	@Override
	public boolean registerEP(SecurityAssessmentVO sa, EPVO ep) {
		log.info("[CONTROLLER]register : " + sa);
		// 1. 마스터 테이블인 SecurityAssessment에 먼저 기본 정보 저장 (자산번호, 유형)
		mapper.insert(sa);

		// 2. EP테이블에 정보 저장
		SecurityAssessmentVO temp = mapper.getSA_no(sa.getSA_daID());
		// 마스터테이블에 저장될 때 자동생성된 pk값을 조회(ep테이블의 pk와 동일)
		log.info("[CONTROLLER]temp : " + temp.getSA_no());
		ep.setEpNo(temp.getSA_no()); // EpNo만 아직 지정되지 않은 상태이기 때문에 받아온 pk값을 setter로 저장
		mapper_ep.insert(ep);

		//3. DA테이블에 자산 식별 상세유형 업데이트
		mapper_DA.updateIdentifyType(sa.getSA_IdentifyType(), sa.getSA_daID().toString());
		return true;
	}

	@Transactional
	@Override
	public boolean registerBOP(SecurityAssessmentVO sa, BOPVO bop) {
		log.info("[CONTROLLER]register : " + sa);
		// 1. 마스터 테이블인 SecurityAssessment에 먼저 기본 정보 저장 (자산번호, 유형)
		mapper.insert(sa);

		// 2. BOP테이블에 정보 저장
		SecurityAssessmentVO temp = mapper.getSA_no(sa.getSA_daID());
		// 마스터테이블에 저장될 때 자동생성된 pk값을 조회(BOP테이블의 pk와 동일)
		log.info("[CONTROLLER]temp : " + temp.getSA_no());
		bop.setBopNo(temp.getSA_no()); // BopNo만 아직 지정되지 않은 상태이기 때문에 받아온 pk값을 setter로 저장
		mapper_bop.insert(bop);

		//3. DA테이블에 자산 식별 상세유형 업데이트
		mapper_DA.updateIdentifyType(sa.getSA_IdentifyType(), sa.getSA_daID().toString());
		return true;
	}

	@Transactional
	@Override
	public boolean registerIndirect(SecurityAssessmentVO sa, IndirectVO ind) {
		log.info("[CONTROLLER]register : " + sa);
		// 1. 마스터 테이블인 SecurityAssessment에 먼저 기본 정보 저장 (자산번호, 유형)
		mapper.insert(sa);

		// 2. Indirect테이블에 정보 저장
		SecurityAssessmentVO temp = mapper.getSA_no(sa.getSA_daID());
		// 마스터테이블에 저장될 때 자동생성된 pk값을 조회(Indirect테이블의 pk와 동일)
		log.info("[CONTROLLER]temp : " + temp.getSA_no());
		ind.setIndirectNo(temp.getSA_no()); // IndirectNo만 아직 지정되지 않은 상태이기 때문에 받아온 pk값을 setter로 저장
		mapper_ind.insert(ind);

		//3. DA테이블에 자산 식별 상세유형 업데이트
		mapper_DA.updateIdentifyType(sa.getSA_IdentifyType(), sa.getSA_daID().toString());
		return true;
	}

	@Override
	public int count(Criteria cri) {
		return mapper.count(cri);
	}

	@Override
	public List<DAVO> search_necessaryList(Criteria cri) {
		return mapper.search_identifyType_is_null(cri);
	}

}
