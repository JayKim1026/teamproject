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
/* 주석처리 완료 */
@Controller
@RequestMapping("/CSCenter")
public class CSController {

	@Inject
	CSService csService;
	
	/* FAQ 페이지 이동 */
	@RequestMapping(value="/FAQ" , method=RequestMethod.GET)
	public String CSCenter(Model model) throws Exception {
		String faqPage = "faqPage";
		model.addAttribute("pageData", faqPage);
		return "CSCenter/FAQ";
	}

	/* FAQ 페이지에서 검색 
	 * category 검색 옵션
	 * keyword 검색할 단어
	 * */
	@RequestMapping(value="/search", method=RequestMethod.GET)
	@ResponseBody
	public List<FAQVo> search(String category, String keyword, Model model) throws Exception {
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		List<FAQVo> searchList = csService.getSearchList(category, keyword);
		System.out.println("serchList controller : " + searchList);
		return searchList;
	}

}
