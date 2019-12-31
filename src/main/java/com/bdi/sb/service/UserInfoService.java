package com.bdi.sb.service;

import java.util.List;

import com.bdi.sb.vo.UserInfoVO;

public interface UserInfoService {
	public List<UserInfoVO> selectUserInfoList(UserInfoVO user);
	public UserInfoVO doLogin(UserInfoVO user);
}
