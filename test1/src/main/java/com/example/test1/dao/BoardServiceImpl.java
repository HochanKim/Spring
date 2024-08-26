package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.BoardList;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;

	// 게시판 리스트
	@Override
	public HashMap<String, Object> selectBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		List<BoardList> list = boardMapper.selectBoard(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	//게시글 삭제
	@Override
	public HashMap<String, Object> delBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap
			= new HashMap<String, Object>();
		try {
			boardMapper.delBoard(map);
			resultMap.put("msg", "삭제하시겠습니까?");
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
		
	}
	
	// 게시글 업로드 
	@Override
	public HashMap<String, Object> insertBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			boardMapper.insertBoard(map);
			System.out.println(map);
			resultMap.put("msg", "게시글 업로드하시겠습니까?");
			resultMap.put("message", "게시글이 저장되었습니다.");
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


}
