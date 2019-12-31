package com.bdi.sb.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bdi.sb.service.TestInfoService;
import com.bdi.sb.vo.TestInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TestInfoController2 {

	@Resource
	private TestInfoService tiService;
	
	
	@GetMapping("/tests2")
	public String getTests(@ModelAttribute TestInfoVO test, Model m){
		m.addAttribute("rMap", tiService.selectTestInfoList(test));
		return "/front/test-list";
	}

}
