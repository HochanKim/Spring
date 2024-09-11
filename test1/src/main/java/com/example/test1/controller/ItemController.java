package com.example.test1.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.ItemService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;


@Controller
public class ItemController {
	
	@Autowired
	ItemService itemService;
	
	// 아이템 불러오기
	@RequestMapping("/item.do") 
	public String list(Model model) throws Exception {
		return "/item-list";
	}
	
	// api
	@RequestMapping("/api1.do") 
	public String api(Model model) throws Exception {
		return "/api-connect";
	}
	
	// 지역
	@RequestMapping("/api-area.do") 
	public String area(Model model) throws Exception {
		return "/api-area";
	}
	

	// ResponseBody
	// 리스트 출력
	@RequestMapping(value = "/item.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String itemList(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(listMap.containsKey("selectItem")) {
			String json = listMap.get("selectItem").toString();
			ObjectMapper mapper = new ObjectMapper();
			List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
			listMap.put("list", list);
		}
		resultMap = itemService.selectItemList(listMap);
		
		return new Gson().toJson(resultMap);
	}
	
	// 코드 리스트
	@RequestMapping(value = "/code-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String itemGroupList(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = itemService.selectCodeList(listMap);
		return new Gson().toJson(resultMap);
	}
	
	
	// 시 리스트
	@RequestMapping(value = "/si-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaList1(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = itemService.selectSiList(listMap);
		return new Gson().toJson(resultMap);
	}
	// 구 리스트
	@RequestMapping(value = "/gu-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaList2(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = itemService.selectGuList(listMap);
		return new Gson().toJson(resultMap);
	}
	// 동 리스트
	@RequestMapping(value = "/dong-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaList3(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = itemService.selectDongList(listMap);
		return new Gson().toJson(resultMap);
	}
	// 좌표 불러오기
	@RequestMapping(value = "/get-point.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaList4(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = itemService.getPoint(listMap);
		return new Gson().toJson(resultMap);
	}
	
	
}
