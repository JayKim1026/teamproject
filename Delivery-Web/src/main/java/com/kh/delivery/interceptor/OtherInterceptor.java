package com.kh.delivery.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.UserVo;

public class OtherInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		if(userVo == null && deliverVo == null) {
			response.sendRedirect("/account/loginForm");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
