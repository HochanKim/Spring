package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.ItemList;
import com.example.test1.model.School;

public interface ItemService {

	HashMap<String, Object> selectItemList(HashMap<String, Object> map);
	HashMap<String, Object> selectCodeList(HashMap<String, Object> map);
	
	HashMap<String, Object> selectSiList(HashMap<String, Object> map);
	HashMap<String, Object> selectGuList(HashMap<String, Object> map);
	HashMap<String, Object> selectDongList(HashMap<String, Object> map);
	
}