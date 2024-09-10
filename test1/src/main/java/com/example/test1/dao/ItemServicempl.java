package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ItemMapper;
import com.example.test1.model.Code;
import com.example.test1.model.ItemList;



@Service
public class ItemServicempl implements ItemService {
	
	@Autowired
	ItemMapper itemMapper;
	

	// 아이템 불러오기
	@Override
	public HashMap<String, Object> selectItemList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<ItemList> items = itemMapper.selectItemList(map);
			resultMap.put("list", items);
			resultMap.put("success", "성공적 호출");
			System.out.println("쿼리에 넘기기 : "+map);
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}

	// 코드 리스트
	@Override
	public HashMap<String, Object> selectCodeList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Code> codeList = itemMapper.selectCodeList(map);
			resultMap.put("codeList", codeList);
			resultMap.put("success", "성공적 호출");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제발생.");
		}
		
		return resultMap;
	}

}
