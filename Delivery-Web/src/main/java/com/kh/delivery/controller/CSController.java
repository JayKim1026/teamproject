package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Sequence;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.FAQVo;
import com.kh.delivery.domain.QuestionVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.CSService;

@Controller
@RequestMapping("/CSCenter")
public class CSController {

	@Inject
	CSService csService;
	
	// FAQ 페이지 이동
	@RequestMapping(value="/FAQ" , method=RequestMethod.GET)
	public String CSCenter(Model model) throws Exception {
		String faqPage = "faqPage";
		model.addAttribute("pageData", faqPage);
		return "CSCenter/FAQ";
	}

	// FAQ 페이지에서 검색
	@RequestMapping(value="/search", method=RequestMethod.GET)
	@ResponseBody
	public List<FAQVo> search(String category, String keyword, Model model) throws Exception {
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		List<FAQVo> searchList = csService.getSearchList(category, keyword);
		System.out.println("serchList controller : " + searchList);
		return searchList;
	}
	
	
/*	보류
	// 1:1 Question 페이지 이동
	
	@RequestMapping(value="/Question", method=RequestMethod.GET)
	public String question(Model model) throws Exception {
		String questionPage = "questionPage";
		model.addAttribute("pageData", questionPage);
		return "CSCenter/Question";
	}
	
	// 1:1 Form
	@RequestMapping(value="/QuestionForm", method=RequestMethod.GET)
	public String questionForm(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo", userVo);
		return "CSCenter/QuestionForm";
	}
	
	// cs 주문조회
	@RequestMapping(value="/orderList", method=RequestMethod.POST)
	public String QuestionOrderList(HttpSession session)throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		int user_no = userVo.getUser_no();
		
		return null;
	}*/
}
