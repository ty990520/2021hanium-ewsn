package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.UserVO;
import com.hanium.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper mapper;

	@Override
	public void register(UserVO user) {
		mapper.insert(user);
	}

	@Override
	public UserVO get(String userid) {
		return mapper.read(userid);
	}

	@Override
	public boolean modify(UserVO user) {
		return mapper.update(user)==1;
	}

	@Override
	public List<UserVO> getList() {
		return mapper.getList();
	}

}
