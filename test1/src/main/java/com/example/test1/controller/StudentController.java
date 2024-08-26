package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.StudentService;
import com.example.test1.model.EmpList;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/student.do") 
    public String main1(Model model) throws Exception{
        return "/student-list";
    }
	
	@RequestMapping("/test.do") // test.do 주소 생성
	public String main2(Model model) throws Exception{
		// 'test.jsp' 파일과 연결
		return "/test";
	}
	
	@RequestMapping("/emp.do") // emp.do 주소 생성
	public String main3(Model model) throws Exception{
		// 'emp-list.jsp' 파일과 연결
		return "/emp-list";
	}
	
	@RequestMapping("/subject.do") // emp.do 주소 생성
	public String main4(Model model) throws Exception{
		// 'emp-list.jsp' 파일과 연결
		return "/subject-list";
	}
	
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'searchBbsList'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = studentService.searchStudentList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/ok.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String method(Model model, @RequestParam HashMap<String, Object> map) throws Exception {		// 메소드명 'method'
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		Student stu = studentService.searchQwer();
		resultMap.put("stu", stu);
		resultMap.put("result", "success");
		// 담겨진 정보 예시 {stu : {stuNo : 20153075, stuNama : 옥한빛, ...}, result : success}
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") // 컨트롤러 주소명(value) : /search.dox
	@ResponseBody
	public String search(Model model, @RequestParam HashMap<String, Object> map) throws Exception {		// 메소드명 'search'
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		resultMap = studentService.geomsaek(map);
		// 담겨진 정보 예시 {stu : {stuNo : 20153088, stuNama : 이태연, ...}, result : success}
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/empList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") // 컨트롤러 주소명(value) : /empList.dox
	@ResponseBody
	public String emp(Model model, @RequestParam HashMap<String, Object> empMap) throws Exception {		// 메소드명 'emp'
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		List<EmpList> emp = studentService.selectEmpList();
		resultMap.put("emp", emp);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/sub-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") // 컨트롤러 주소명(value) : /subject.dox
	@ResponseBody
	public String subject(Model model, @RequestParam HashMap<String, Object> subjMap) throws Exception {		// 메소드명 'subject'
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		resultMap = studentService.selectSubjectList();
		
		return new Gson().toJson(resultMap);
	}
}


