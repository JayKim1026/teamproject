package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.MessageVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.MessageService;
import com.kh.delivery.service.OrderService;
import com.kh.delivery.util.Codes;

@Controller
@RequestMapping(value="/message")
public class MessageController implements Codes {

	@Inject
	MessageService messageService;
	@Inject
	OrderService orderService;

	// 공용
	@RequestMapping(value="/getMessageList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		System.out.println("getMessageList");
		System.out.println(messageVo);
		List<MessageVo> messageList = messageService.getMessageList(messageVo);
		System.out.println(messageList);
		return messageList;
	}
	
	@RequestMapping(value="/getCurrentMessage", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		System.out.println("getCurrentMessage");
		System.out.println(messageVo);
		List<MessageVo> messageList = messageService.getCurrentMessage(messageVo);
		System.out.println(messageList);
		return messageList;
	}
	
	@RequestMapping(value="/sendMsgContent", method=RequestMethod.POST)
	@ResponseBody
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgContent(messageVo);
		return result;
	}
	
	@RequestMapping(value="/sendMsgImg", method=RequestMethod.POST)
	@ResponseBody
	public String sendMsgImg(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgImg(messageVo);
		return result;
	}

	
	// 웹
	@RequestMapping(value="/messageForm", method=RequestMethod.GET)
	public String messageForm(HttpSession session, Model model) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		OrderVo orderVo = orderService.getMyOrder(userVo.getUser_no());
		model.addAttribute("orderVo", orderVo);
		model.addAttribute("image_url", BUCKET_URL);
		return "user/message";
	}
	
	

	// 안드로이드
	
}
