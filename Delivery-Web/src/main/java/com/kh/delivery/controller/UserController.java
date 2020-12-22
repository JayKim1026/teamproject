package com.kh.delivery.controller;

import javax.inject.Inject;

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
	public String LoginForm(String user_id, String user_pw) {
		return "pages/loginForm";
	}
	
	@RequestMapping(value="/loginRun")
	public String LoginRun(String user_id, String user_pw) {
		
		return "redirect:pages/loginForm";
	}
	
	@RequestMapping(value="/registerForm")
	public String registerForm(UserVo userVo) {
		return "pages/registerForm";
	}
	
	@RequestMapping(value="/registerRun")
	public void registerRun(UserVo userVo) {
		
	}
	
	
	/*주소 검색*/
	@RequestMapping(value="/address", method=RequestMethod.GET)
	public String address() throws Exception {
		return "util/address";
	}
}
