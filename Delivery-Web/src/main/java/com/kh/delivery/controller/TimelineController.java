package com.kh.delivery.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.delivery.service.TimelineService;

@Controller
@RequestMapping(value="/timeline")
public class TimelineController {
	
	@Inject
	private TimelineService timelineService;
	
	@RequestMapping(value="/showTimeline")
	public String timeline() {
		
		return "pages/timeline";
	}
	
	@RequestMapping(value="/insertArticle", method=RequestMethod.POST)
	public void insertArticle(int user_no, String review_content) {
		System.out.println("timelineController, insertArticle, user_no:" + user_no);
		System.out.println("timelineController, insertArticle, review_content:" + review_content);
		timelineService.insertArticle(user_no, review_content);
		
	}
}
