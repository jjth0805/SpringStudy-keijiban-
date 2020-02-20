package com.sesoc.myboard.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(value="myGuestbook/writeGuestbook", method=RequestMethod.POST)
	public String writeGuestbook(MyGuestbookVO vo, HttpSession session, RedirectAttributes rttr ) {
		boolean result = false;
		if(dao.writeGuestbook(vo, session)!=0) result = true;
		rttr.addFlashAttribute("writeResult",result);
		return "redirect:/myGuestbook/myGuestbookList";
	}
	@RequestMapping(value="myGuestbook/deleteGuestbook", method=RequestMethod.GET)
	public String deleteGuestbook(MyGuestbookVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = false;
		System.out.println(vo);
		if(dao.deleteGuestbook(vo, session)!=0) result=true;
		rttr.addFlashAttribute("delResult",result);
		return "redirect:/myGuestbook/myGuestbookList";
	}
}
