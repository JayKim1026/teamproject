package com.kh.delivery.controller;

import java.io.File;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.delivery.domain.AccountDto;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value="/util")
public class UtilController {
	
	private final static String NAMESPACE = "com.kh.delivery.util.";

	@Inject
	private JavaMailSender mailSender;
	@Inject
	private SqlSession sqlSession;

	@RequestMapping(value="/daumAddress", method=RequestMethod.GET)
	public String daumAddress() throws Exception {
		return "util/daum_address";
	}
	
	@RequestMapping(value="/findAccountId", method=RequestMethod.POST)
	@ResponseBody
	public String findAccountId(AccountDto accountDto) throws Exception {
		String acc_id = sqlSession.selectOne(NAMESPACE + "findAccountId", accountDto);
		return acc_id;
	}

	@RequestMapping(value="/findAccountPw", method=RequestMethod.POST)
	@ResponseBody
	public String findAccountPw(AccountDto accountDto) throws Exception {
		String acc_pw = sqlSession.selectOne(NAMESPACE + "findAccountPw", accountDto);
		return acc_pw;
	}
	
	@RequestMapping(value="/sendAccountPw", method=RequestMethod.POST)
	@ResponseBody
	public String sendAccountPw(AccountDto accountDto) throws Exception {
		String acc_pw = accountDto.getAcc_pw();
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
	
}
