package com.sesoc.myboard.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

	private int replynum;
	private int boardNum;
	private String userid;
	private String replytext;
	private String inputdate;
}
