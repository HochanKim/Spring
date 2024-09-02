package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.BoardList;

public interface BoardService {
	
	HashMap<String, Object> selectBoard(HashMap<String, Object> map); // 게시판 불러오기
	
	HashMap<String, Object> delBoard(HashMap<String, Object> map); // 게시글 삭제
	
	HashMap<String, Object> insertBoard(HashMap<String, Object> map); // 게시글 업로드
	
	HashMap<String, Object> getBoard(HashMap<String, Object> map); // 게시글 상세보기
	
}