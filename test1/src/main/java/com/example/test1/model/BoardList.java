package com.example.test1.model;

import lombok.Data;	// 'lombok'은 'getter'와 'setter'을 생략하게 해줌

@Data
public class BoardList {
	private int boardno;
	private String title;
	private String contents;
	private String userid;
	private int hit;
	private int category;
	private int favorite;
	private String tag1;
	private String tag2;
	private String noticeYN;
	private String cdatetime;
	private String udatetime;
}
