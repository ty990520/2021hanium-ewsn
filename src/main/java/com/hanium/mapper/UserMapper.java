package com.hanium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanium.domain.Criteria;
import com.hanium.domain.UserVO;

public interface UserMapper {
	public List<UserVO> getList();
	public List<UserVO> getListWithPaging(Criteria cri);
	public List<UserVO> getUserRequest(Criteria cri);
	//public List<UserVO> getUserRequestWithPaging();
	public List<UserVO> getAdminRequest(Criteria cri);
	//public List<UserVO> getAdminRequestWithPaging();
	public UserVO findUserValidity(String userid);
	public UserVO read(String userid);
	public UserVO get(String userid);
	public void insert(UserVO user);	
	public int update(UserVO user);
	public int updateDept(@Param("userptype") String userptype,@Param("userdept") String userdept,@Param("userid") String userid);
	public int userValidityCheck(UserVO user);
	public int userPermission(UserVO user);
	public UserVO login(@Param("userid") String userid, @Param("userpw") String userpw);
	public int count(Criteria cri);
	public void updatePassword(@Param("userpw") String userpw,@Param("userid") String userid);
	public int userDropout(@Param("userid") String userid);
}
