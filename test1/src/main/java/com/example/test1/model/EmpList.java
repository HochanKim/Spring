package com.example.test1.model;

import lombok.Data;	// getter, setter을 생략하게 해줌

@Data
public class EmpList {
	private String EMPNO;
	private String EName;
	private String JOB;
	private String MGR;
	private String HIREDATE;
	private String SAL;
	private String COMM;
	private String DEPTNO;
}
