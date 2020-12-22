package com.kh.delivery.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Inject
	private UserService userService;
	
	/*로그인 , 회원가입, 아이디or비밀번호 찾기 */
	
	@RequestMapping(value="/loginForm")
	public String loginForm(String user_id, String user_pw) throws Exception {
		return "pages/loginForm";
	}
	
	@RequestMapping(value="/loginRun")
	public String loginRun(String user_id, String user_pw, HttpSession session) throws Exception {
		System.out.println(user_id + user_pw);
		UserVo userVo = userService.login(user_id, user_pw);
		
		if(userVo != null) {
			session.setAttribute("userVo", userVo);
			return "redirect:/";
		} else {}
		
		return "pages/loginForm";
	}
	
	@RequestMapping(value="/registerForm")
	public String registerForm(UserVo userVo) throws Exception {
		return "pages/registerForm";
	}
	
	@RequestMapping(value="/registerRun")
	public void registerRun(UserVo userVo) throws Exception {
		
	}
	
	/*주소 검색*/
	@RequestMapping(value="/address", method=RequestMethod.GET)
	public String address() throws Exception {
		return "util/address";
	}
}
