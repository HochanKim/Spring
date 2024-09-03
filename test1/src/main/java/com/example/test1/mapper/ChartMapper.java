package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.test1.model.Chart;

@Mapper
public interface ChartMapper {
	
	List<Chart> selectChart(HashMap<String, Object> map);
	
	List<Chart> selectSiArea(HashMap<String, Object> map);
	
	List<Chart> selectGuArea(HashMap<String, Object> map);
	
	List<Chart> selectDongArea(HashMap<String, Object> map);

}
