package com.sesoc.myboard.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyGuestbookInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  Object handler) throws Exception{
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		if(userid==null) {
			response.sendRedirect(request.getContextPath()+"/myMember/myLoginForm");
			return false;
		}
		return true;
	}
}
