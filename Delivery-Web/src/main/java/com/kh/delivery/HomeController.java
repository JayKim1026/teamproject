package com.kh.delivery;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "redirect:/main/main";
	}

	@RequestMapping(value="/daumAddress", method=RequestMethod.GET)
	public String daumAddress() throws Exception {
		return "util/daum_address";
	}
	
}
