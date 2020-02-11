package com.sesoc.myboard.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyBoardVO {

	private int boardNum;
	private String userid;
	private String title;
	private String content;
	private String inputdate;
	private int hit;
	private String originalFileName;
	private String savedFileName;
}
