package com.nainfox.service;

import java.util.List;
import java.util.Map;

import com.nainfox.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getList();

	void add(BoardVo boardVo);

	BoardVo selectOne(int id);

	Map<String, Object> boardSearchPageList(Map<String, Object> searchMap);


	
}
