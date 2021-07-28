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
	public boolean findUserValidity(String userid);		//사번 인증 (유효성확인)
	public boolean setUserValid(UserVO user);	//사번 인증 (valid체크)
	public boolean setUserPermission(UserVO user);		//유저 승인
	public boolean login(String userid, String userpw);
	public boolean updateUserDept(String userptype, String userdept, String userid);
}
