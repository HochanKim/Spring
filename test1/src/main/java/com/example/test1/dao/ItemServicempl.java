package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.test1.constants.ResMessage;
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
			resultMap.put("result", "success");
			resultMap.put("message", ResMessage.SUCCESS);
		} catch (DataAccessException e) {
			resultMap.put("message", ResMessage.DB_ACCESS_ERROR);
			resultMap.put("result", "fail");
		} catch (PersistenceException e) {
			resultMap.put("message", ResMessage.MYBATIS_ERROR);
			resultMap.put("result", "fail");
		} catch (Exception e) {
		resultMap.put("message", ResMessage.UNKNOWN_ERROR);
		resultMap.put("result", "fail");
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
	
	// 지역

	@Override
	public HashMap<String, Object> selectSiList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ItemList> siList = itemMapper.selectSiList(map);
		resultMap.put("siList", siList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> selectGuList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ItemList> guList = itemMapper.selectGuList(map);
		resultMap.put("guList", guList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> selectDongList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ItemList> dongList = itemMapper.selectDongList(map);
		resultMap.put("dongList", dongList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getPoint(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ItemList point = itemMapper.getPoint(map);
		resultMap.put("point", point);
		return resultMap;
	}


}
