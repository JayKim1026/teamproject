package com.kh.delivery.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.service.DeliverService;

@Controller
@RequestMapping(value="/deliver")
public class DeliverController {

	@Inject
	DeliverService deliverService;
	
	// 웹
	
	// 배달원 회원가입
	@RequestMapping(value="/dlvr_RegisterForm", method=RequestMethod.GET)
	public String dlvr_RegisterForm() throws Exception {
		return "pages/dlvr_RegisterForm";
	}
	
	@RequestMapping(value="/dlvr_RegisterRun", method=RequestMethod.POST)
	public String dlvr_RegisterRun(DeliverVo deliverVo, String str_dlvr_birth, RedirectAttributes rttr) throws Exception {
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date dlvr_birth = new Date(df.parse(str_dlvr_birth).getTime());
		deliverVo.setDlvr_birth(dlvr_birth);
		System.out.println(deliverVo);
//		String result = deliverService.registDeliver(deliverVo) ;
//		System.out.println("result = " + result);
//		rttr.addFlashAttribute("msg", result);
		
		return "redirect:/";
	}
	
	
	// 배달원 로그인
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun(String dlvr_id, String dlvr_pw, HttpSession session) throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		
		if(deliverVo != null) {
			session.setAttribute("deliverVo", deliverVo);
		}
		return "redirect:/";
	}
	
	
	
	// 안드로이드
	// 배달원 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}
}
