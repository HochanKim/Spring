package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.School;

public interface ItemService {

	HashMap<String, Object> selectItemList(HashMap<String, Object> map);
	HashMap<String, Object> selectCodeList(HashMap<String, Object> map);
	
}