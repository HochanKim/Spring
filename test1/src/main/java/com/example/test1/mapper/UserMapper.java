package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.BoardList;
import com.example.test1.model.UserList;

@Mapper
public interface UserMapper {
	
	List<UserList> insertUser(HashMap<String, Object> map);			// 여러개, join.jsp, xml에서 id를 'insertUser'로 설정, 파라미터로 'Map'형태로 전달
	
	UserList getUserInfo(HashMap<String, Object> map);				// 1개(회원 id, pk값)
	
	List<UserList> getUserList(HashMap<String, Object> map);	// 여러개 리턴, xml에서 설정한 id를 호출
	
	List<BoardList> getBoardList(HashMap<String, Object> map);	// 여러개 리턴, 게시글 불러오기 
	
	UserList getRemove(HashMap<String, Object> map);		// 유저 삭제
}
