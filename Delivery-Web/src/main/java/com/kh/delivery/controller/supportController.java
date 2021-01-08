package com.kh.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/serviceCenter")
public class supportController {

	@RequestMapping(value="/FAQ" , method=RequestMethod.GET)
	public String supportCenter() throws Exception {
		return "/serviceCenter/FAQ";
	}
}
