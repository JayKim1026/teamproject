package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.MessageVo;
import com.kh.delivery.service.MessageService;

@Controller
@RequestMapping(value="/message")
public class MessageController {

	@Inject
	MessageService messageService;
	
	@RequestMapping(value="/android/getMessageList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageService.getMessageList(messageVo);
		return messageList;
	}
	
	@RequestMapping(value="/android/getCurrentMessage", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageService.getCurrentMessage(messageVo);
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
