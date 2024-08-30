package com.example.test1.model;

import lombok.Data;	// 'lombok'은 'getter'와 'setter'을 생략하게 해줌

@Data
public class UserList {
	private String userId;
	private String pwd;
	private String username;
	private String email;
	private String phone;
	private String gender;
	private String status;
	
	// 세션에서 저장한 set 메소드를 가져오는 get 메소드
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return username;
	}
	public String getStatus() {
		return status;
	}
	public String getEmail() {
		return email;
	}
}
