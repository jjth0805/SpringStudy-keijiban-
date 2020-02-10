package com.sesoc.myboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.myboard.dao.MyMemberDAO;
import com.sesoc.myboard.vo.MyMemberVO;

@Controller
public class MyMemberController {
	
	@Autowired
	private MyMemberDAO dao;
	
	//会員登録画面
	@RequestMapping(value = "myMember/mySignupForm", method = RequestMethod.GET)
	public String signupForm() {
		return "myMember/mySignupForm";
	}
	//加入
	@RequestMapping(value = "myMember/mySignup", method = RequestMethod.POST)
	public String signup(MyMemberVO vo, RedirectAttributes rttr) {
		boolean result = dao.myMemberSignup(vo);
		rttr.addFlashAttribute("signupResult", result);
		return "redirect:/";
	}
	//ログイン画面
	@RequestMapping(value = "myMember/myLoginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "myMember/myLoginForm";
	}
	//ログイン
	@RequestMapping(value = "myMember/myLogin", method = RequestMethod.POST)
	public String login(MyMemberVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean result = dao.myMemberLogin(vo, session);
		if(result) return "redirect:/";
		rttr.addFlashAttribute("loginResult", result);
		return "redirect:/myMember/myLoginForm";
	}
	//ログアウト
	@RequestMapping(value = "myMember/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		dao.logout(session);
		return "redirect:/";
	}
	//アカウント中腹確認画面
	@RequestMapping(value = "myMember/idCheckForm", method = RequestMethod.GET)
	public String idCheckForm() {
		return "myMember/idCheckForm";
	}
	//アカウント中腹確認
	@RequestMapping(value = "myMember/checkid", method = RequestMethod.POST)
	public String checkid(String userid, RedirectAttributes rttr) {
		boolean checkResult=false;
		if(dao.checkid(userid)==0) checkResult=true;
		rttr.addFlashAttribute("checkResult",checkResult);
		rttr.addFlashAttribute("userid", userid);
		return "redirect:/myMember/idCheckForm";
	}
}
