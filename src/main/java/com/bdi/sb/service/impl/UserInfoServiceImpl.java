package com.bdi.sb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdi.sb.mapper.UserInfoMapper;
import com.bdi.sb.service.UserInfoService;
import com.bdi.sb.util.SHAUtil;
import com.bdi.sb.vo.UserInfoVO;

import cc.duduhuo.util.digest.Digest;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Resource
	private UserInfoMapper uiMapper;
	@Override
	public List<UserInfoVO> selectUserInfoList(UserInfoVO user) {
		return uiMapper.selectUserInfoList(user);
	}
	@Override
	public UserInfoVO doLogin(UserInfoVO user) {
		user.setUiPwd(SHAUtil.getSHA(user.getUiPwd()));
		return uiMapper.doLogin(user);
	}

}
