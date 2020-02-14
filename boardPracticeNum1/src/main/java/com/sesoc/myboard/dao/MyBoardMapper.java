package com.sesoc.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.myboard.vo.MyBoardVO;

public interface MyBoardMapper {

	public ArrayList<MyBoardVO> myBoardList(HashMap<String, String> map);
	public int myBoardWrite(MyBoardVO vo);
	public MyBoardVO myBoardRead(int boardNum);
	public int myBoardDelete(MyBoardVO vo);
}
