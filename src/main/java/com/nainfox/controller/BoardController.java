package com.nainfox.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nainfox.service.BoardService;
import com.nainfox.service.FileService;
import com.nainfox.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private FileService fileService;
	
	@GetMapping("/board/list")
	public String getList(Model model) {
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("keyword", "");
		boardMap.put("page", 1);
		boardMap.put("option", "all");
		Map<String, Object> resultMap = boardService.boardSearchPageList(boardMap);
		model.addAttribute("boardMap", resultMap);
		return "/board/list.jsp";
	}
	
	@GetMapping("/board/add")
	public String addForm(Model model) {
		BoardVo bvo = new BoardVo();
		model.addAttribute("boardVo", bvo);
		return "/board/add.jsp";
	}
	
	@PostMapping("/board/add")
	public String add(@ModelAttribute @Valid BoardVo boardVo, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "/board/add.jsp";
		}
		boardService.add(boardVo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/board/view")
	public String view(@RequestParam int id, Model model) {
		BoardVo selectView = boardService.selectOne(id);
		model.addAttribute("board", selectView);
		return "/board/view.jsp";
	}
	
	@PostMapping(value="/board/boardPaging")
	@ResponseBody
	public Map<String, Object> boardPaging(@RequestParam String keyword, @RequestParam int page,
			@RequestParam String option){
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("keyword", keyword);
		searchMap.put("page", page);
		searchMap.put("option", option);
		System.out.println(option);
		Map<String, Object> resultMap = boardService.boardSearchPageList(searchMap);
		return resultMap;
	}
	
	@PostMapping("/board/imgUpload")
	@ResponseBody
	public Map<String, String> summernote_imgUpload(@RequestParam MultipartFile file, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/upload_img");
		String url;
		try {
			url = "/resources/upload_img/" + fileService.uploadImg(path, file);
			Map<String, String> urlMap = new HashMap<>();
			urlMap.put("url", url);
			return urlMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
