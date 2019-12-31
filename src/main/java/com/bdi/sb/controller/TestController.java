package com.bdi.sb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class TestController {
	@GetMapping("/hello")
	public String hello() {
		log.info("난 무조건 2번째로 실행됨");
		return "hello~~";
	}
	
	@GetMapping("/hellos")
	public List<String> hellos(){
		List<String> strList = new ArrayList<>();
		strList.add("hello");
		strList.add("안녕하세요~");
		strList.add("good morning~");
		return strList;
	}
}
