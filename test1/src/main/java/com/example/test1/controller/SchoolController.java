package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.SchoolService;
import com.google.gson.Gson;

@Controller
public class SchoolController {
	
	@Autowired
	SchoolService stuService;
	
	// 'school-stu.jsp' 테이블 출력 주소
	@RequestMapping("/school-stu.do") 
	public String list(Model model) throws Exception{
		return "/school-stu";
	}
	
	// 'school-stuView.jsp' 테이블 출력 주소
	@RequestMapping("/school-stuView.do") 
	public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));	// 'school-stu.do'에서 클릭시 전달하는 매개변수를 담는 역할
		return "/school-stuView";
	}
	
	// 'school-stuInfo.jsp' 테이블 출력 주소
	@RequestMapping("/school-stuInfo.do") 
	public String info(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));	// 'school-stu.do'에서 클릭시 전달하는 매개변수를 담는 역할
		return "/school-stuInfo";
	}
	
	// 'school-update.jsp' 테이블 출력 주소
	@RequestMapping("/school-update.do") 
	public String update(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));	// 'school-stu.do'에서 클릭시 전달하는 매개변수를 담는 역할
		return "/school-update";
	}
	
	
	// ResponseBody
	// 학생 데이터 호출
	@RequestMapping(value = "/school-stu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuList(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { // 메소드명 'stuList'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = stuService.selectStuList(listMap);
		return new Gson().toJson(resultMap);
	}
	
	
	
	// 상세정보 출력 (school-stuView.do)
	@RequestMapping(value = "/school-stuView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuView(Model model, @RequestParam HashMap<String, Object> viewMap) throws Exception { // 메소드명 'stuView'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = stuService.selectStuView(viewMap);
		return new Gson().toJson(resultMap);
	}
	
	// 상세정보 출력 (school-stuInfo.do)
	@RequestMapping(value = "/school-stuInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuInfo(Model model, @RequestParam HashMap<String, Object> viewMap) throws Exception { // 메소드명 'stuView'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = stuService.selectStuInfo(viewMap);
		return new Gson().toJson(resultMap);
	}
	
	// 특정 데이터 삭제
	@RequestMapping(value = "/school-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuDel(Model model, @RequestParam HashMap<String, Object> viewMap) throws Exception { // 메소드명 'stuDel'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = stuService.deleteStudent(viewMap);
		return new Gson().toJson(resultMap);
	}
	
	// 학생 정보 수정
	@RequestMapping(value = "/school-update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuUp(Model model, @RequestParam HashMap<String, Object> infoMap) throws Exception { // 메소드명 'stuUp'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = stuService.updateStudent(infoMap);
		return new Gson().toJson(resultMap);
	}
	
}
