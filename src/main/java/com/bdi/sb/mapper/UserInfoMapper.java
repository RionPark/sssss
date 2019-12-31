package com.bdi.sb.mapper;

import java.util.List;

import com.bdi.sb.vo.UserInfoVO;

public interface UserInfoMapper {
	public List<UserInfoVO> selectUserInfoList(UserInfoVO user);
	public UserInfoVO doLogin(UserInfoVO user);
}
