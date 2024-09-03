package com.example.test1.model;

import lombok.Data;	// 'lombok'은 'getter'와 'setter'을 생략하게 해줌

@Data
public class Chart {
	// 차트
	private String cname;
	private String price;
	private String pdate;
	
	// 지역
	private String si;
	private String gu;
	private String dong;
}
