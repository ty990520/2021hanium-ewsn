package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.SecurityAssessmentVO;
import com.hanium.mapper.SecurityAssessmentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SecurityAssessmentServiceImpl implements SecurityAssessmentService{

	private SecurityAssessmentMapper mapper;
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
		return mapper.update(sa)==1;
	}

	@Override
	public List<SecurityAssessmentVO> getList() {
		return mapper.getList();
	}

}
