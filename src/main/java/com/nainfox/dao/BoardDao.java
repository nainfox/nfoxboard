package com.nainfox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nainfox.vo.BoardVo;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession session;
	
	public List<BoardVo> getList(){
		return session.selectList("board.selectList");
	}

	public void add(BoardVo boardVo) {
		session.insert("board.insertBoard", boardVo);
	}

	public BoardVo selectOne(int id) {
		return session.selectOne("board.selectOne", id);
	}

	public int totalCount(Map<String, Object> searchMap) {
		return session.selectOne("board.totalCount", searchMap);
	}

	public List<BoardVo> boardSearchPage(Map<String, Object> searchMap) {
		return session.selectList("board.searchPage", searchMap);
	};
	
	
}
