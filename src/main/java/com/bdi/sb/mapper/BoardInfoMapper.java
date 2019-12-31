package com.bdi.sb.mapper;

import java.util.List;

import com.bdi.sb.vo.BoardInfoVO;
import com.bdi.sb.vo.PageVO;

public interface BoardInfoMapper {

	List<BoardInfoVO> selectBoardInfoList(BoardInfoVO board, PageVO page);
	int insertBoardInfo(BoardInfoVO board);
}
