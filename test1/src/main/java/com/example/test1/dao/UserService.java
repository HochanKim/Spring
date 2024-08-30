package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.UserList;

public interface UserService {
	
	HashMap<String, Object> insertUser(HashMap<String, Object> map); 	// 회원가입
	
	HashMap<String, Object> userLogin(HashMap<String, Object> map); 	// 로그인
	
	HashMap<String, Object> getUserInfo(HashMap<String, Object> map);	// 사용자 정보
	
	HashMap<String, Object> getUserList(HashMap<String, Object> map);	// 유저 리스트, mapper를 호출
	
	HashMap<String, Object> getBoardList(HashMap<String, Object> map);	// 게시글 리스트, mapper를 호출
	
	HashMap<String, Object> getRemove(HashMap<String, Object> map);		// 유저 삭제

}