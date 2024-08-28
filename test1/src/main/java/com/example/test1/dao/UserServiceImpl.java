package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.BoardList;
import com.example.test1.model.UserList;



@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	// 회원가입
	@Override
	public HashMap<String, Object> insertUser(HashMap<String, Object> joinMap) {
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			userMapper.insertUser(joinMap);
			List<UserList> join = userMapper.insertUser(joinMap);
			resultMap.put("join", join);
			resultMap.put("message", "가입이 완료되었습니다.");
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 사용자 정보
	@Override
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			UserList user = userMapper.getUserInfo(map);		
			// * 복사하는 과정에서 메소드를 수정하지 않아 불러오지 못함
			resultMap.put("info", user);
			resultMap.put("result", "success");
			resultMap.put("message", "조회완료");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		return resultMap;
	}
	
	// 유저 리스트
	@Override
	public HashMap<String, Object> getUserList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<UserList> list = userMapper.getUserList(map);		
			resultMap.put("list", list);
			resultMap.put("result", "success");
			resultMap.put("message", "조회완료");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		return resultMap;
	}
	
	// 유저 삭제
	@Override
	public HashMap<String, Object> getRemove(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			UserList remove = userMapper.getRemove(map);		
			resultMap.put("remove", remove);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		return resultMap;
	}
	
	// 게시글
	@Override
	public HashMap<String, Object> getBoardList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<BoardList> list = userMapper.getBoardList(map);		
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		return resultMap;
	}


	



}
