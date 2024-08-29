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

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	

	// 회원가입 페이지
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{
        return "/join";
    }
	
	// 사용자 정보
	@RequestMapping("/user-info.do") 
	public String userInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("userId", map.get("userId"));
		return "/user_info";
	}
	
	// 로그인 페이지
	@RequestMapping("/login.do") 
	public String login(Model model) throws Exception{
		return "/login";
	}
	
	// 유저 리스트
	@RequestMapping("/user-list.do") 
	public String list(Model model) throws Exception{
		return "/user-list";
	}
	
	
	// ResponseBody
	// 회원가입
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertUser(Model model, @RequestParam HashMap<String, Object> joinMap) throws Exception { // 메소드명 'insertUser'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.insertUser(joinMap);
		return new Gson().toJson(resultMap);
	}
	
	// 로그인
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> joinMap) throws Exception { // 메소드명 'login'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.userLogin(joinMap);
		return new Gson().toJson(resultMap);
	}
	
	
	// 사용자 정보
	@RequestMapping(value = "/user-info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getUserInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'getUserInfo'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getUserInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	// 중복체크
	@RequestMapping(value = "/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'getUserInfo'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getUserInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	// 유저 리스트
	@RequestMapping(value = "/user-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userList(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'userList'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getUserList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 리스트
	@RequestMapping(value = "/board-lists.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String BoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'userList'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 유저 삭제
	@RequestMapping(value = "/user-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'remove'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.getRemove(map);
		return new Gson().toJson(resultMap);
	}
	


}
