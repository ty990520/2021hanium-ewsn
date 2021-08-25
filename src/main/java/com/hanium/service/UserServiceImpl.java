package com.hanium.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hanium.domain.Criteria;
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
	public List<UserVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<UserVO> getUserRequest(Criteria cri) {
		return mapper.getUserRequest(cri);
	}

	@Override
	public List<UserVO> getAdminRequest(Criteria cri) {
		return mapper.getAdminRequest(cri);
	}

	@Override
	public boolean setUserValid(UserVO user) {
		return mapper.userValidityCheck(user)==1;
	}

	@Override
	public boolean setUserPermission(UserVO user) {
		return mapper.userPermission(user)==1;
	}

	@Override
	public boolean findUserValidity(String userid) {
		UserVO validUser = mapper.findUserValidity(userid);
		if(validUser==null) {
			return false;
		}
		else
			return true;
	}

	@Override
	public boolean login(String userid, String userpw) {
		UserVO user = mapper.login(userid, userpw);
		if(user==null) {
			return false;
		}
		else
			return true;
	}

	@Override
	public boolean updateUserDept(String userptype, String userdept, String userid) {
		return mapper.updateDept(userptype, userdept, userid)==1;
	}

	@Override
	public UserVO findNotOnlyUser(String userid) {
		return mapper.get(userid);
	}

	@Override
	public int count(Criteria cri) {
		return mapper.count(cri);
	}

	@Override
	public void updatePassword(String userpw, String userid) {
		mapper.updatePassword(userpw, userid);
	}

	@Override
	public boolean dropout(String userid) {
		return mapper.userDropout(userid)==1;
	}

	
}
