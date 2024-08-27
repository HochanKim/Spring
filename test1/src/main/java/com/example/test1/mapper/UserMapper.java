package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.test1.model.UserList;

@Mapper
public interface UserMapper {
	List<UserList> insertUser(HashMap<String, Object> map);	// 여러개, join.jsp, xml에서 id를 'insertUser'로 설정, 파라미터로 'Map'형태로 전달
	
	UserList getUserInfo(HashMap<String, Object> map);	// 1개(회원 id, pk값)
	
}
