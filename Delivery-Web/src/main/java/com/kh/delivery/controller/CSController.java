package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;
import javax.sound.midi.Sequence;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.FAQVo;
import com.kh.delivery.service.CSService;

@Controller
@RequestMapping("/CSCenter")
public class CSController {

	@Inject
	CSService csService;
	
	@RequestMapping(value="/FAQ" , method=RequestMethod.GET)
	public String CSCenter(Model model) throws Exception {
		
		return "CSCenter/FAQ";
	}
	
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
