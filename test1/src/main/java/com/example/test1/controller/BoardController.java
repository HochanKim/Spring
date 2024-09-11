package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
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

import com.example.test1.dao.BoardService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;

	// 게시글 목록 페이지
	@RequestMapping("/board-list.do") 
    public String boardList(Model model) throws Exception {
        return "/board_list";
    }
	
	// 게시글 작성
	@RequestMapping("/board-insert.do") 
	public String boardInsert(Model model) throws Exception {
		return "/board_insert";
	}
	
	// 게시글 상세보기
	@RequestMapping("/board-view.do") 
	public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("boardNo", map.get("boardNo"));
		return "/board_view";
	}
	
	// ResponseBody
	// 게시글 목록 페이지
	@RequestMapping(value = "/board-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'boardList'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.selectBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/board-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'boardRemove'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.delBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 선택 삭제
	@RequestMapping(value = "/check-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'checkRemove'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// json 형태의 문자열로 쿼리에 전송
		String json = map.get("selectItem").toString(); 
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		boardService.delCheckBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 작성
	@RequestMapping(value = "/board-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'boardInsert'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.insertBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "/board-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception { // 메소드명 'getBoard'
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.getBoard(map);
		return new Gson().toJson(resultMap);
	}
	

	// 파일 업로드
	@RequestMapping("/fileUpload.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam int idx, HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String url = null;
        String path=System.getProperty("user.dir");
        try {
 
//			String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
//	        String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path + "\\src\\webapp\\img");
            if(!multi.isEmpty()){
                File file = new File(path + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("filePath", "../img/" + saveFileName);	// 팀 작업시 파일 관련 애로사항이 생길 경우가 있기 때문에 '상대경로'를 지정
                map.put("idx", idx);
                map.put("fileOrgName", originFilename);
                map.put("fileSize", size);
                map.put("fileExt", extName);
                
                // insert 쿼리 실행 
                boardService.insertBoardFile(map);
                System.out.println(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:board-list.do";
            }
        } catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:board-list.do";
    }

	 private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
	    }


}
