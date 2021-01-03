package com.kh.delivery.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value="/util")
public class UtilController {

	@RequestMapping(value="/daumAddress", method=RequestMethod.GET)
	public String daumAddress() throws Exception {
		return "util/daum_address";
	}
	
}
