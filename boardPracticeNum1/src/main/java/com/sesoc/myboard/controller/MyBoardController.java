package com.sesoc.myboard.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.myboard.dao.MyBoardDAO;
import com.sesoc.myboard.vo.MyBoardVO;

@Controller
public class MyBoardController {
	
	@Autowired
	private MyBoardDAO dao;

	@RequestMapping(value = "myBoard/myBoardList", method = {RequestMethod.GET, RequestMethod.POST})
	public String myBoardList(Model model
			,@RequestParam(value="searchItem", defaultValue="userid") String searchItem
			,@RequestParam(value="searchKeyword", defaultValue="") String searchKeyword
			) {
		ArrayList<MyBoardVO> list = dao.myBoardList(searchItem, searchKeyword);
		model.addAttribute("list",list);
		return "myBoard/myBoardList";
	}
	@RequestMapping(value = "myBoard/myBoardWriteForm", method = RequestMethod.GET)
	public String myBoardWriteForm() {
		return "myBoard/myBoardWriteForm";
	}
	//文書き
	@RequestMapping(value = "myBoard/myBoardWrite", method = RequestMethod.POST)
	public String myBoardWrite(MyBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		if(dao.myBoardWrite(vo,session)==1) result=true;
		rttr.addFlashAttribute("writeResult",result);
		return "redirect:/myBoard/myBoardList";
	}
	@RequestMapping(value = "myBoard/myBoardRead", method = RequestMethod.GET)
	public String myBoardRead(int boardNum, Model model) {
		MyBoardVO vo = dao.myBoardRead(boardNum, model);
		model.addAttribute("vo",vo);
		return "myBoard/myBoardRead";
	}
	@RequestMapping(value = "myBoard/myBoardDelete", method = RequestMethod.GET)
	public String myBoardDelete(MyBoardVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result=false;
		if(dao.myBoardDelete(vo,session)!=0) result=true;
		rttr.addFlashAttribute("boardDelResult",result);
		return "redirect:/myBoard/myBoardList";
	}
}
