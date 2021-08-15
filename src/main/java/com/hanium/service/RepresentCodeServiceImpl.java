package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.RepresentCodeVO;
import com.hanium.mapper.RepresentCodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RepresentCodeServiceImpl implements RepresentCodeService{

	private RepresentCodeMapper mapper;
	
	@Override
	public void register(RepresentCodeVO re) {
		mapper.insert(re);
	}

	@Override
	public RepresentCodeVO get(Long represent_id) {
		return mapper.read(represent_id);
	}

	@Override
	public boolean modify(RepresentCodeVO re) {
		return mapper.update(re)==1;
	}

	@Override
	public List<RepresentCodeVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<RepresentCodeVO> getReCodeList() {
		return mapper.getReCodeList();
	}

	@Override
	public List<RepresentCodeVO> getDeCodeList(String R_code) {
		return mapper.getDeCodeList(R_code);
	}

	@Override
	public boolean checkExistRecode(String R_code) {
		if(mapper.checkExistRecode(R_code) != 0)
			return true;
		else 
			return false;
	}

	@Override
	public boolean checkExistDecode(String R_code, String D_code) {
		if(mapper.checkExistDecode(R_code, D_code) != 0)
			return true;
		else 
			return false;
	}

}
