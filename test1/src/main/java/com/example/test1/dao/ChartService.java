package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.School;

public interface ChartService {

	HashMap<String, Object> selectChart(HashMap<String, Object> listMap);

	HashMap<String, Object> selectAreaList(HashMap<String, Object> listMap);
	
}