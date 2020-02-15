package com.sesoc.myboard.dao;

import java.util.ArrayList;

import com.sesoc.myboard.vo.ReplyVO;

public interface ReplyMapper {

	public void replyWrite(ReplyVO vo);
	public ArrayList<ReplyVO> replyList(int boardNum);
	public void replyDelete(ReplyVO vo);
}
