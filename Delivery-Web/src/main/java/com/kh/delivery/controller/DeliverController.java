package com.kh.delivery.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.service.DeliverService;

@Controller
@RequestMapping(value="/deliver")
public class DeliverController {

	@Inject
	DeliverService deliverService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}
}
