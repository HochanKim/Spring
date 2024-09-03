package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ChartMapper;
import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.Chart;
import com.example.test1.model.School;

@Service
public class ChartServicempl implements ChartService {
	
	@Autowired
	ChartMapper chartMapper;
	/*
	 * @Autowired 
	 * HttpSession session;
	 */
	
	// 차트
	@Override
	public HashMap<String, Object> selectChart(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Chart> chart = chartMapper.selectChart(map);
			resultMap.put("chart", chart);
			resultMap.put("success", "성공적 호출");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	

	}

	// 지역
	@Override
	public HashMap<String, Object> selectAreaList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Chart> area = null;
		try {
			if(!map.get("gu").equals("")) {
				area = chartMapper.selectDongArea(map);
			} else if(!map.get("si").equals("")) {
				area = chartMapper.selectGuArea(map);
			} else {
				area = chartMapper.selectSiArea(map);
			}
			resultMap.put("area", area);
			resultMap.put("success", "성공적 호출");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}

}
