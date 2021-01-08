package com.kh.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/test")
public class TestController {

	@RequestMapping(value="/messageTest", method=RequestMethod.GET)
	public String messageTest() throws Exception {
		return "user/messageTest";
	}
}
