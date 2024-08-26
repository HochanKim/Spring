package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.BoardList;

@Mapper
public interface BoardMapper {
	List<BoardList> selectBoard(HashMap<String, Object> map);	// 여러개, xml에서 id를 'selectBoard'로 설정, 파라미터로 'Map'형태로 전달
	
	void delBoard(HashMap<String, Object> map); // 게시글 삭제
	
	void insertBoard(HashMap<String, Object> map); // 게시글 업로드
	
}
