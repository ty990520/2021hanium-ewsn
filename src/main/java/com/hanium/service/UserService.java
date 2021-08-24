package com.hanium.service;

import java.util.List;

import com.hanium.domain.Criteria;
import com.hanium.domain.UserVO;

public interface UserService {
	public void register(UserVO user);		//등록
	public UserVO get(String userid);			//유저만 가져옴
	public UserVO findNotOnlyUser(String userid);	//회원가입한 모든 사람(미승인자도 포함) id조회
	public boolean modify(UserVO user);		//수정
	public List<UserVO> getList(Criteria cri);	
	public List<UserVO> getUserRequest(Criteria cri);	
	public List<UserVO> getAdminRequest(Criteria cri);	
	public boolean findUserValidity(String userid);		//사번 인증 (유효성확인)
	public boolean setUserValid(UserVO user);	//사번 인증 (valid체크)
	public boolean setUserPermission(UserVO user);		//유저 승인
	public boolean login(String userid, String userpw);
	public boolean updateUserDept(String userptype, String userdept, String userid);
	public int count(Criteria cri);
	public void updatePassword(String userpw, String userid);
	public boolean dropout(String userid);
}
