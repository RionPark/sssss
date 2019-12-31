package com.bdi.sb.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.service.BoardInfoService;
import com.bdi.sb.vo.BoardInfoVO;
import com.bdi.sb.vo.PageVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class BoardInfoController {

	@Resource
	private BoardInfoService biService;
	
	
	@PostMapping("/boardinfo")
	public Map<String,Object> insertBoard(BoardInfoVO board){
		log.info("board=>{}", board);
		int cnt = biService.insertBoardInfo(board);
		return null;
	}
	@GetMapping("/boardinfos")
	public List<BoardInfoVO> selectBoardInfo(BoardInfoVO board, PageVO page) {
		log.info("page=>{}",page);
		String str = "";
		for(int i=1;i<=60000;i++) {
			str += i;
		}
		return biService.selectBoardInfoList(board, page);
	}
}
