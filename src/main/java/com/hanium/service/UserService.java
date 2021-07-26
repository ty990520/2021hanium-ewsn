package com.hanium.service;

import java.util.List;

import com.hanium.domain.UserVO;

public interface UserService {
	public void register(UserVO user);		//등록
	public UserVO get(String userid);			//글 조회
	public boolean modify(UserVO user);		//수정
	public List<UserVO> getList();	
	public List<UserVO> getUserRequest();	
	public List<UserVO> getAdminRequest();	
}
