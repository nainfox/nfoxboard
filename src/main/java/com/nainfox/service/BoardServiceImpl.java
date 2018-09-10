package com.nainfox.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nainfox.dao.BoardDao;
import com.nainfox.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	private static final int maxCountOfOneList = 10;
	
	public List<BoardVo> getList(){
		return boardDao.getList();
	}

	@Override
	public void add(BoardVo boardVo) {
		boardDao.add(boardVo);
	}

	@Override
	public BoardVo selectOne(int id) {
		return boardDao.selectOne(id);
	}

	@Override
	public Map<String, Object> boardSearchPageList(Map<String, Object> searchMap) {
		int totalCount = boardDao.totalCount(searchMap);
		int page = (int)(searchMap.get("page"));
		int startRownum = (page - 1) * maxCountOfOneList + 1;
		int endRownum = startRownum + (maxCountOfOneList - 1);
		
		searchMap.put("total", totalCount);
		searchMap.put("start", startRownum);
		searchMap.put("end", endRownum);
		
		List<BoardVo> boardList = boardDao.boardSearchPage(searchMap);
		
		searchMap.put("boardList", boardList);
		int totalPage = 0;
		
		if(totalCount % maxCountOfOneList == 0) {
			totalPage = totalCount / maxCountOfOneList;
		}else {
			totalPage = (totalCount / maxCountOfOneList) + 1;
		}
		
		searchMap.put("totalPage", totalPage);
		return searchMap;
		
	};
	
	
	
	
	
}
