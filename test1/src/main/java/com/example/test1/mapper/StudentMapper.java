package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.EmpList;
import com.example.test1.model.Student;

@Mapper
public interface StudentMapper {
	List<Student> selectStudentList(); // 여러개
	
	Student qwer();	// 1개, xml의 id를 'qwer'로 설정
	
	Student geomsaek(HashMap<String, Object> map);	// xml에서 id를 'geomsaek'로 설정
	
	List<EmpList> selectEmpList();	// 여러개, xml에서 id를 'selectEmpList'로 설정
	
	List<Student> selectSubjectList();	// 여러개, xml에서 id를 'selectSubjList'로 설정
	
	List<Student> groupEmpList(HashMap<String, Object> map);	// emp 예시
}
