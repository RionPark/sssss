package com.bdi.sb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AOPTestController {
	
	@GetMapping("/aop/1")
	public String aop1() {
		return "abc";
	}
	
	@GetMapping("/aop/2")
	private void aop2() {
	}

	@GetMapping("/aop/3")
	public List<String> aop3(){
		return new ArrayList<>();
	}
	
	@GetMapping("/aop/4")
	private List<String> aop4(){
		return new ArrayList<>();
	}
}
