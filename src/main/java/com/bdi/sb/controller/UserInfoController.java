package com.bdi.sb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.service.UserInfoService;
import com.bdi.sb.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserInfoController {
	@Resource
	private UserInfoService uiService;
	
	@GetMapping("/users")
	public List<UserInfoVO> getUserInfoList(){
		return uiService.selectUserInfoList(null);
	}
	
	@PostMapping("/user/login")
	public UserInfoVO doLogin(@ModelAttribute UserInfoVO user) {
		return uiService.doLogin(user);
	}
}
