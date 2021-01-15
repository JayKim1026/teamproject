package com.kh.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@RequestMapping(value="/main")
	public String main() throws Exception{
		return "admin/main";
	}
	
	@RequestMapping(value="/reportPage", method=RequestMethod.GET)
	public String reportPage() throws Exception {
		return "admin/report";
	}
}
