package com.bdi.sb.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bdi.sb.service.TestInfoService;
import com.bdi.sb.vo.TestInfoVO;

@Controller
@RequestMapping("/testv")
public class TestInfoViewController {
	
	@Resource
	private TestInfoService tiService;
	
	@GetMapping("tests")
	public String getTestInfoList(@ModelAttribute TestInfoVO test, Model m  ) {
		m.addAttribute("rMap",tiService.selectTestInfoList(test));
		return "/views/test/list";
	}
}
