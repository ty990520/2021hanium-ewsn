package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.UserVO;

public interface UserMapper {
	public List<UserVO> getList();
	public List<UserVO> getUserRequest();
	public List<UserVO> getAdminRequest();
	public UserVO read(String userid);
	public void insert(UserVO user);	
	public int update(UserVO user);
	public int userValidityCheck(UserVO user);
	public int userPermission(UserVO user);
}
