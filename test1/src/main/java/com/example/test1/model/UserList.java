package com.example.test1.model;

import lombok.Data;	// 'lombok'은 'getter'와 'setter'을 생략하게 해줌

@Data
public class UserList {
	private String userid;
	private String pwd;
	private String username;
	private String email;
	private String phone;
	private String gender;
	private String cdatetime;
}
