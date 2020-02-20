package com.sesoc.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.myboard.vo.MyGuestbookVO;

public interface MyGuestbookMapper {

	public ArrayList<MyGuestbookVO>myGuestbookList(HashMap<String, String> map); 
	public int deleteGuestbook(MyGuestbookVO vo);
	public int writeGuestbook(MyGuestbookVO vo);
	public MyGuestbookVO readGuestbook(int seq);
}
