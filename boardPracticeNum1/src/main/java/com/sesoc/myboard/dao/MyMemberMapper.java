package com.sesoc.myboard.dao;

import com.sesoc.myboard.vo.MyMemberVO;

public interface MyMemberMapper {

	public int myMemberSignup(MyMemberVO vo);
	public int myMemberLogin(MyMemberVO vo);
	public int checkid(String userid);
}
