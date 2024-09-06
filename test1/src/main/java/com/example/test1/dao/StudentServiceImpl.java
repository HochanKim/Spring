package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.EmpList;
import com.example.test1.model.Student;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;
	
	@Override
	public List<Student> searchStudentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentList();
	}

	@Override
	public Student searchQwer() {
		// TODO Auto-generated method stub
		Student s = studentMapper.qwer();
		return s;
	}

	@Override
	public HashMap<String, Object> geomsaek(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// db호출 데이터, 결과(성공 or 실패), 메시지(성공 or 오류 메시지)
			Student s = studentMapper.geomsaek(map);
			resultMap.put("stu", s);
			resultMap.put("result", "success");
			String msg = s != null ? "조회완료" : "학번을 다시 한 번 확인바람";
			resultMap.put("message", msg);
			
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "db조회 오류");
		}
		return resultMap;
	}

	@Override
	public List<EmpList> selectEmpList() {
		List<EmpList> emp = studentMapper.selectEmpList();
		return emp;
	}
	
	@Override
	public HashMap<String, Object> selectSubjectList() {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> subject = studentMapper.selectSubjectList();
		List<Student> student = studentMapper.selectStudentList();
		
		resultMap.put("subList", subject);
		resultMap.put("stuList", student);
		
		return resultMap;	// 리턴 타입이 'HashMap<String, Object>'
	}

	@Override
	public HashMap<String, Object> groupEmpList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Student> group = studentMapper.groupEmpList(map);
			resultMap.put("dept", group);
			resultMap.put("result", "success");
			String msg = group != null ? "조회완료" : "학번을 다시 한 번 확인바람";
			resultMap.put("message", msg);
			
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "db조회 오류");
		}
		return resultMap;
	}

}
