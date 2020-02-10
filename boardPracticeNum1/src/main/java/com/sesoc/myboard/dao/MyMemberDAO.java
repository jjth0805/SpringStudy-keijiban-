package com.sesoc.myboard.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.myboard.vo.MyMemberVO;

@Repository
public class MyMemberDAO {
	@Autowired
	private SqlSession sqlSession;

	public boolean myMemberSignup(MyMemberVO vo) {
		int result=0;
		try {
			MyMemberMapper mapper = sqlSession.getMapper(MyMemberMapper.class);
			result=mapper.myMemberSignup(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result==1) return true;
		return false;
	}
	public boolean myMemberLogin(MyMemberVO vo, HttpSession session) {
		int result=0;
		try {
			MyMemberMapper mapper = sqlSession.getMapper(MyMemberMapper.class);
			result=mapper.myMemberLogin(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result==0) return false;
		session.setAttribute("userid", vo.getUserid());
		return true;
	}
	public void logout(HttpSession session) {
		session.removeAttribute("userid");
	}
	public int checkid(String userid) {
		int result=0;
		try {
			MyMemberMapper mapper = sqlSession.getMapper(MyMemberMapper.class);
			result=mapper.checkid(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}