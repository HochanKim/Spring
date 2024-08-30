package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.School;

@Mapper
public interface SchoolMapper {
	
	List<School> selectStuList(HashMap<String, Object> map); // 전체 학생 리스트 (여러개 정보 요청)
	
	School selectStuView(HashMap<String, Object> map); // 특정 학생 상세정보 (1개 정보 요청, 이름 클릭)
	
	School deleteStudent(HashMap<String, Object> map); // 특정 학생 삭제 (1개 정보 요청)
	
	School updateStudent(HashMap<String, Object> map); // 특정 학생 정보 수정 (1개 정보 요청)
	
	School selectStuInfo(HashMap<String, Object> map); // 특정 학생 정보 (1개 정보 요청, 이름 클릭) 
}
