package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.MessageVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.service.MessageService;
import com.kh.delivery.service.OrderService;

@Controller
@RequestMapping(value="/message")
public class MessageController {

	@Inject
	MessageService messageService;
	@Inject
	OrderService orderService;
	
	
	@RequestMapping(value="/messageForm", method=RequestMethod.GET)
	public String messageForm(int user_no, Model model) throws Exception {
		OrderVo orderVo = orderService.getMyOrder(user_no);
		model.addAttribute("orderVo", orderVo);
		return "user/message";
	}
	
	@RequestMapping(value="/android/getMessageList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		System.out.println("getMessageList");
		System.out.println(messageVo);
		List<MessageVo> messageList = messageService.getMessageList(messageVo);
		System.out.println(messageList);
		return messageList;
	}
	
	@RequestMapping(value="/android/getCurrentMessage", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		System.out.println("getCurrentMessage");
		System.out.println(messageVo);
		List<MessageVo> messageList = messageService.getCurrentMessage(messageVo);
		System.out.println(messageList);
		return messageList;
	}
	
	@RequestMapping(value="/android/sendMsgContent", method=RequestMethod.POST)
	@ResponseBody
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgContent(messageVo);
		return result;
	}
	
	@RequestMapping(value="/android/sendMsgImg", method=RequestMethod.POST)
	@ResponseBody
	public String sendMsgImg(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgImg(messageVo);
		return result;
	}
	
}
