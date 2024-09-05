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

import com.example.test1.dao.ChartService;
import com.google.gson.Gson;


@Controller
public class ChartController {
	
	@Autowired
	ChartService chartService;
	
	// 차트
	@RequestMapping("/chart.do") 
	public String list(Model model) throws Exception {
		return "/chart";
	}
	
	// 결제
	@RequestMapping("/payment.do") 
	public String payment(Model model) throws Exception {
		return "/payment";
	}
	
	// 지역
	@RequestMapping("/area.do") 
	public String area(Model model) throws Exception {
		return "/area";
	}
	
	// 주소
	@RequestMapping("/addr.do") 
	public String address(Model model) throws Exception {
		return "/jusoPopup";
	}

	// ResponseBody
	// 차트
	@RequestMapping(value = "/chart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuList(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartService.selectChart(listMap);
		return new Gson().toJson(resultMap);
	}
	
	// 지역
	@RequestMapping(value = "/area.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaList(Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartService.selectAreaList(map);
		return new Gson().toJson(resultMap);
	}
	
}
