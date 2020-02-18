package com.sesoc.myboard.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyGuestbookVO {

	private int seq;
	private String userid;
	private String content;
	private String regdate;
	private String originalFilename;
	private String savedFilename;
}
