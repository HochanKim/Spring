package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.UserList;

public interface UserService {
	HashMap<String, Object> insertUser(HashMap<String, Object> map); // 회원가입
	
	HashMap<String, Object> getUserInfo(HashMap<String, Object> map);	// 사용자 정보

}