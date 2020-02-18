package com.sesoc.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.myboard.vo.MyGuestbookVO;

@Repository
public class MyGuestbookDAO {
	@Autowired
	private SqlSession sqlSession;
	
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
}
