package com.sesoc.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.myboard.vo.MyGuestbookVO;

@Repository
public class MyGuestbookDAO {
	@Autowired
	private SqlSession sqlSession;
	//芳名録list
	public ArrayList<MyGuestbookVO> myGuestbookList(String searchItem, String searchKeyword) {
		HashMap<String,String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		ArrayList<MyGuestbookVO> list=null;
		try {
			MyGuestbookMapper mapper = sqlSession.getMapper(MyGuestbookMapper.class);
			list=mapper.myGuestbookList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int writeGuestbook(MyGuestbookVO vo, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		int result = 0;
		try {
			MyGuestbookMapper mapper = sqlSession.getMapper(MyGuestbookMapper.class);
			result=mapper.writeGuestbook(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteGuestbook(MyGuestbookVO vo, HttpSession session) {
			String userid = (String)session.getAttribute("userid");
			vo.setUserid(userid);
			int result=0;
		try {
			MyGuestbookMapper mapper = sqlSession.getMapper(MyGuestbookMapper.class);
			mapper.deleteGuestbook(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
