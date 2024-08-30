package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.School;

public interface SchoolService {
	
	HashMap<String, Object> selectStuList(HashMap<String, Object> map); // 전체 학생 DB 불러오기
	
	HashMap<String, Object> selectStuView(HashMap<String, Object> map); // 특정 학생 상세정보 불러오기 (이름 클릭)
	
	HashMap<String, Object> deleteStudent(HashMap<String, Object> map); // 특정 학생 삭제
	
	HashMap<String, Object> updateStudent(HashMap<String, Object> map); // 학생 정보 업데이트
	
	HashMap<String, Object> selectStuInfo(HashMap<String, Object> map); // 학생 정보 (학번 클릭)
}