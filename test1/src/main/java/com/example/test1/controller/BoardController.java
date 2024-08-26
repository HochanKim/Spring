package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.StudentService;
import com.example.test1.model.BoardList;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;

	// 게시글 목록 페이지
	@RequestMapping("/board-list.do") 
    public String boardList(Model model) throws Exception{
        return "/board_list";
    }
	
	// 게시글 작성
	@RequestMapping("/board-insert.do") 
	public String boardInsert(Model model) throws Exception{
		return "/board_insert";
	}

	@RequestMapping(value = "/board-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'boardList'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.selectBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	//게시글 삭제
	@RequestMapping(value = "/board-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'boardRemove'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.delBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	//게시글 작성
	@RequestMapping(value = "/board-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'boardInsert'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.insertBoard(map);
		return new Gson().toJson(resultMap);
	}
	

}
