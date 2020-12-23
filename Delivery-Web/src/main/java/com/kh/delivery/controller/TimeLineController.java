package com.kh.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/timeLine")
public class TimeLineController {
	
	@RequestMapping(value="/showTimeLine")
	public String timeLine() {
		
		return "pages/timeLine";
	}
}
