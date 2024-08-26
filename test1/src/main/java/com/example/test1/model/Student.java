package com.example.test1.model;

import lombok.Data;

@Data
public class Student {
	private String stuNo;
	private String stuName;
	private String stuDept;
	private String stuGrade;
	private String stuClass;
	private String stuGender;
	private String stuHeight;
	private String stuWeight;
	
	// subject 테이블 컬럼
	private String SUBNO;
	private String SUBNAME;
	private String SUBPROF;
	private String SUBGRADE;
	private String SUBDEPT;
}
