package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.School;

@Service
public class SchoolServiceImpl implements SchoolService {
	
	@Autowired
	SchoolMapper stuMapper;
	/*
	 * @Autowired 
	 * HttpSession session;
	 */
	
	// 전체 학생 DB 불러오기
	@Override
	public HashMap<String, Object> selectStuList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<School> stuList = stuMapper.selectStuList(map);
			int page = stuMapper.countStuList(map);
			resultMap.put("list", stuList);
			resultMap.put("page", page);
			resultMap.put("result", "success");
			resultMap.put("message", "호출 성공");
			
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}
	
	
	// 특정 학생 상세정보 불러오기
	@Override
	public HashMap<String, Object> selectStuView(HashMap<String, Object> viewMap) {
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			School stuView = stuMapper.selectStuView(viewMap);
			resultMap.put("info", stuView);
			resultMap.put("result", "success");
			resultMap.put("message", "호출 성공");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}
	

	// 삭제 기능
	@Override
	public HashMap<String, Object> deleteStudent(HashMap<String, Object> delMap) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			School stuDel = stuMapper.deleteStudent(delMap);
			resultMap.put("del", stuDel);
			resultMap.put("result", "success");
			resultMap.put("message", "삭제 성공");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}

	// 업데이트
	@Override
	public HashMap<String, Object> updateStudent(HashMap<String, Object> upMap) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			School stuInfo = stuMapper.updateStudent(upMap);
			resultMap.put("update", stuInfo);
			resultMap.put("result", "success");
			resultMap.put("message", "호출 성공");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}

	
	// 학생 상세정보 (학번 클릭)
	@Override
	public HashMap<String, Object> selectStuInfo(HashMap<String, Object> infoMap) {
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			School stuInfo = stuMapper.selectStuInfo(infoMap);
			resultMap.put("info", stuInfo);
			resultMap.put("result", "success");
			resultMap.put("message", "호출 성공");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}



}
