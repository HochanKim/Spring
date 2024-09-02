package com.example.test1.model;

import lombok.Data;	// 'lombok'은 'getter'와 'setter'을 생략하게 해줌

@Data
public class BoardList {
	private int boardno;
	private String title;
	private String contents;
	private String userId;
	private int hit;
	private int category;
	private int favorite;
	private String tag1;
	private String tag2;
	private String noticeYN;
	private String cdatetime;
	private String udatetime;
	
	// 조인
	// 유저
	private String username;
	private String status;
	private String email;
	
	// 댓글
	private String commentNo;

	// 세션 정보 가져오기
	public String getUserId() {
		// 아이디
		return userId;
	}

	public String getUserName() {
		// 이름
		return username;
	}
	
	public String getStatus() {
		// 지위
		return status;
	}
	
	public String getEmail() {
		// 이메일
		return status;
	}
}
