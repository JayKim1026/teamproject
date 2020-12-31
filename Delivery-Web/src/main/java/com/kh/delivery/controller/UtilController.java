package com.kh.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/util")
public class UtilController {

	@RequestMapping(value="/daumAddress", method=RequestMethod.GET)
	public String daumAddress() throws Exception {
		return "util/daum_address";
	}
}
