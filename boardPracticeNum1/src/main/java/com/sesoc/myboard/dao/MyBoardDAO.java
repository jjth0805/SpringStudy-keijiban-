package com.sesoc.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.sesoc.myboard.vo.MyBoardVO;
@Repository
public class MyBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<MyBoardVO> myBoardList(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword",searchKeyword);
		ArrayList<MyBoardVO> list = null;
		try {
			MyBoardMapper mapper = sqlSession.getMapper(MyBoardMapper.class);
			list = mapper.myBoardList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int myBoardWrite(MyBoardVO vo, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		int result=0;
		try {
			MyBoardMapper mapper = sqlSession.getMapper(MyBoardMapper.class);
			result = mapper.myBoardWrite(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public MyBoardVO myBoardRead(int boardNum, Model model) {
		MyBoardVO vo = null;
		try {
			MyBoardMapper mapper = sqlSession.getMapper(MyBoardMapper.class);
			vo = mapper.myBoardRead(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}
