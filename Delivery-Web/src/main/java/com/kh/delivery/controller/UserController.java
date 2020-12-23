package com.kh.delivery.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Inject
	private UserService userService;
	@Inject
	private JavaMailSender mainSender;
	
	// 웹
	
	// 로그인
	@RequestMapping(value="/loginForm")
	public String loginForm(String user_id, String user_pw) throws Exception {
		return "pages/loginForm";
	}
	
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, HttpSession session) throws Exception {
		System.out.println("loginRun, user_info = " + user_id + ", " + user_pw);
		UserVo userVo = userService.login(user_id, user_pw);
		System.out.println("loginRun, userVo = " + userVo);
		if(userVo != null) {
			session.setAttribute("userVo", userVo);
			return "redirect:/";
		} else {
			session.setAttribute("login_result", "login_fail");
			return "redirect:/user/loginForm";
		}
	}
	
	
	// 아이디 중복 체크
	@RequestMapping(value="/checkIdDupl", method=RequestMethod.GET)
	@ResponseBody
	public boolean checkIdDupl(String user_id) throws Exception {
		System.out.println("checkDulp, user_id = " + user_id);
		boolean result = userService.checkIdDupl(user_id);
		return result;
	}
	
	
	//회원 가입
	@RequestMapping(value="/registerForm")
	public String registForm() throws Exception {
		return "pages/registerForm";
	}
	
	@RequestMapping(value="/registerRun")
	public String registRun(UserVo userVo, RedirectAttributes rttr) throws Exception {
		System.out.println(userVo);
		String result = userService.registUser(userVo);
		System.out.println("result = " + result);
		rttr.addFlashAttribute("msg", result);
		return "redirect:/";
	}
	
	
	/*주소 검색*/
	@RequestMapping(value="/address", method=RequestMethod.GET)
	public String address() throws Exception {
		return "util/address";
	}
	
	// 아이디, 비밀번호 찾기
	@RequestMapping(value="/findAccountForm", method=RequestMethod.GET)
	public String findAccountForm() throws Exception {
		return "pages/findAccountForm";
	}
	
	@RequestMapping(value="/findAccountRun", method=RequestMethod.POST)
	public String findAccountRun(String user_name, String user_phone, String user_email, RedirectAttributes rttr) throws Exception {
		System.out.println("findAccount, user_info = " + user_name + ", " + user_phone + ", " + user_email);
		UserVo userVo = userService.findAccount(user_name, user_phone, user_email);
		System.out.println(userVo);
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom("eogml0807@gmail.com");
				helper.setTo(userVo.getUser_email());
				helper.setSubject("계정 정보");
				helper.setText("아이디 = " + userVo.getUser_id() + ", 비밀번호 = " + userVo.getUser_pw());
			}
		};
		
		mainSender.send(preparator);
		rttr.addFlashAttribute("msg", "send email");
		return "redirect:/";
	}
	
	
	// 안드로이드
	// 유저 정보 가져오기
	@RequestMapping(value="/getUserInfo", method=RequestMethod.POST)
	@ResponseBody
	public UserVo getUserInfo(int user_no) throws Exception {
		System.out.println("getUserInfo, user_no = " + user_no);
		UserVo userVo = userService.getUserInfo(user_no);
		System.out.println("getUserInfo, userVo = " + userVo.toString());
		return userVo;
	}
	
}
