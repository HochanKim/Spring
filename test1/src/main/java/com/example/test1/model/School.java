package com.example.test1.model;

import lombok.Data;

@Data
public class School {
	private String stuNo;
	private String name;
	private String id;
	private String grade;
	private String jumin;
	private String birthday;
	private String tel;
	
	// Join 컬럼명 파라미터
	private String dName1;	// 학부
	private String dName2;	// 학과
	private String prof;	// 담당 교수
}
