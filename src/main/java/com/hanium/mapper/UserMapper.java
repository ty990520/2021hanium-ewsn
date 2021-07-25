package com.hanium.mapper;

import java.util.List;

import com.hanium.domain.UserVO;

public interface UserMapper {
	public List<UserVO> getList();
	public UserVO read(String userid);
	public void insert(UserVO user);	
	public int update(UserVO user);
}
