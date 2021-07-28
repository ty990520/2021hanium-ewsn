package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.UserVO;

public interface UserMapper {
	public List<UserVO> getList();
	public List<UserVO> getUserRequest();
	public List<UserVO> getAdminRequest();
	public UserVO findUserValidity(String userid);
	public UserVO read(String userid);
	public void insert(UserVO user);	
	public int update(UserVO user);
	public int userValidityCheck(UserVO user);
	public int userPermission(UserVO user);
	public UserVO login(@Param("userid") String userid, @Param("userpw") String userpw);
}
