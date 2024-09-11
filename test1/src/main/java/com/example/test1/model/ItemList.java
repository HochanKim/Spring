package com.example.test1.model;

import lombok.Data;	// 'lombok'은 'getter'와 'setter'을 생략하게 해줌

@Data
public class ItemList {
	private int itemNo;
	private String itemName;
	private int price;
	private String category1;
	
	// 조인
	private String codeName;
	
	// 지역
	private String si;
	private String gu;
	private String dong;
	private String nx;
	private String ny;
	
}
