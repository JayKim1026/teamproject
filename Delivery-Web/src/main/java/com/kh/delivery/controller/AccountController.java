package com.kh.delivery.controller;

import java.util.List;

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

import com.kh.delivery.domain.AccountDto;
import com.kh.delivery.service.AccountService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

	@Inject
	JavaMailSender mailSender;
	@Inject
	AccountService accountService;

	// 로그인 페이지
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "account/loginForm";
	}
	// 사용자 회원가입 페이지
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registForm() throws Exception {
		return "account/registerForm";
	}
	// 배달원 회원가입 페이지
	@RequestMapping(value = "/dlvr_RegisterForm", method = RequestMethod.GET)
	public String dlvr_RegisterForm() throws Exception {
		return "account/dlvr_RegisterForm";
	}
	// 아이디, 비밀번호 찾기 페이지
	@RequestMapping(value = "/findAccountForm", method = RequestMethod.GET)
	public String findAccountForm() throws Exception {
		return "account/findAccountForm";
	}
	// 로그아웃
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	// 아이디 중복확인
	@RequestMapping(value = "/checkIdDupl", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkIdDupl(String acc_id) throws Exception {
		boolean result = accountService.checkIdDupl(acc_id);
		return result;
	}
	// 아이디 찾기
	@RequestMapping(value = "/findAccountId", method = RequestMethod.POST)
	@ResponseBody
	public String findAccountId(AccountDto accountDto) throws Exception {
		String acc_id = accountService.findAccountId(accountDto);
		return acc_id;
	}
	// 비밀번호 찾기
	@RequestMapping(value = "/sendAccountPw", method = RequestMethod.POST)
	@ResponseBody
	public String sendAccountPw(AccountDto accountDto) throws Exception {
		String acc_pw = accountService.findAccountPw(accountDto);
		String acc_email = accountDto.getAcc_email();
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				String text = "비밀번호는 " + acc_pw + " 입니다.";

				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom("eogml0807@gmail.com");
				helper.setTo(acc_email);
				helper.setSubject("계정 비밀번호");
				helper.setText(text);
			}
		};
		mailSender.send(preparator);
		return "sendAccountPw_success";
	}
	// 포인트 랭킹 조회
	@RequestMapping(value="/getPointRank", method=RequestMethod.POST)
	@ResponseBody
	public List<AccountDto> getPointRank() throws Exception {
		List<AccountDto> pointRank = accountService.getPointRank();
		System.out.println("pointRank = " + pointRank);
		return pointRank;
	}
}
