package com.sesoc.myboard.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sesoc.myboard.dao.MyGuestbookDAO;
import com.sesoc.myboard.vo.MyGuestbookVO;

@Controller
public class MyGuestbookController {
	
	@Autowired
	private MyGuestbookDAO dao;
	
	@RequestMapping(value="myGuestbook/myGuestbookList", method = {RequestMethod.POST, RequestMethod.GET})
	public String guestbookList(Model model
			,@RequestParam(value="searchItem", defaultValue="userid") String searchItem 
			,@RequestParam(value="searchKeyword", defaultValue="") String searchKeyword) {
		ArrayList<MyGuestbookVO> list = dao.myGuestbookList(searchItem, searchKeyword);
		model.addAttribute("list", list);
		return "myGuestbook/myGuestbookList";
	}
}
