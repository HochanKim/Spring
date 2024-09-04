package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.BoardList;
import com.example.test1.model.UserList;



@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;

	// 회원가입
	@Override
	public HashMap<String, Object> insertUser(HashMap<String, Object> joinMap) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(joinMap);
		try {
			userMapper.insertUser(joinMap);
			resultMap.put("message", "가입이 완료되었습니다.");
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 로그인 
	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> loginMap) {
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			UserList login = userMapper.userLogin(loginMap);
			if(login == null) {	// 'service'단에서 데이터를 가공 및 처리할 수 있다
				resultMap.put("code", "100");
				UserList idCheck = userMapper.getUserInfo(loginMap);
				if(idCheck == null) {
					resultMap.put("code", "200");
				} else {
					resultMap.put("code", "300");
				}
				
			} else {
				resultMap.put("code", "400");
				session.setAttribute("sessionId", login.getUserId());
				session.setAttribute("sessionName", login.getUserName());
				session.setAttribute("sessionStatus", login.getStatus());
				session.setAttribute("sessionEmail", login.getEmail());
			}
		} catch (Exception e) {
			resultMap.put("code", "500");
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
			userMapper.getRemove(map);
			resultMap.put("result", "success");
			resultMap.put("msg", "삭제되었습니다.");
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
