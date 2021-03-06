package com.sesoc.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.myboard.vo.MyBoardVO;
import com.sesoc.myboard.vo.ReplyVO;

public interface MyBoardMapper {

	public ArrayList<MyBoardVO> myBoardList(HashMap<String, String> map, RowBounds rb);
	public int myBoardWrite(MyBoardVO vo);
	public MyBoardVO myBoardRead(int boardNum);
	public int myBoardDelete(MyBoardVO vo);
	public void myBoardHit(int boardNum);
	public int myBoardUpdate(MyBoardVO vo);
	public int getTotal(HashMap<String, String> map);
}
