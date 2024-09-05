package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.BoardList;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	HttpSession session;

	// 게시판 리스트 +  페이지 자동화
	@Override
	public HashMap<String, Object> selectBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BoardList> list = boardMapper.selectBoard(map);	// 게시판 리스트
		int page = boardMapper.pageNum(map);					// 페이지 자동화
		resultMap.put("page", page);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	//게시글 삭제
	@Override
	public HashMap<String, Object> delBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
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
			resultMap.put("idx", map.get("boardNo"));	// 키값 'idx'에 담은 'map'의 'boardNo'(게시글번호, pk값)
			resultMap.put("msg", "게시글 업로드하시겠습니까?");
			resultMap.put("message", "게시글이 저장되었습니다.");
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 게시글 상세보기
	@Override
	public HashMap<String, Object> getBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			BoardList list = boardMapper.getBoard(map);		
			List<BoardList> commentList = boardMapper.getComment(map);		
			// 복사하는 과정에서 메소드를 수정하지 않아 불러오지 못함
			resultMap.put("info", list);
			resultMap.put("comment", commentList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 파일 업로드
	@Override
	public HashMap<String, Object> insertBoardFile(HashMap<String, Object> map) {
		boardMapper.insertBoardFile(map);
		return null;
	}


}
