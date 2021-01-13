package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.delivery.domain.FAQVo;
import com.kh.delivery.service.CSService;

@Controller
@RequestMapping("/CSCenter")
public class CSController {

	@Inject
	CSService csService;
	
	@RequestMapping(value="/FAQ" , method=RequestMethod.GET)
	public String supportCenter(Model model) throws Exception {
		List<FAQVo> FAQList = csService.getFAQList();
		model.addAttribute("FAQList", FAQList);
		return "CSCenter/FAQ";
	}
	
	
}
