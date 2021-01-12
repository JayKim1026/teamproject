package com.kh.delivery.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.delivery.domain.MessageVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.MessageService;
import com.kh.delivery.service.OrderService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

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

	
	// 웹
	@RequestMapping(value="/sendMsgImg", method=RequestMethod.POST)
	@ResponseBody
	public String sendMsgImg(MessageVo messageVo, MultipartFile f_msg_img, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String org_file_name = f_msg_img.getOriginalFilename();
		if(FileUploadUtil.isImage(org_file_name)) {
			String msg_img = MESSAGE_IMG + userVo.getUser_id() + "_" + org_file_name;
			messageVo.setMsg_img(msg_img);
			String result = messageService.sendMsgImg(messageVo);
			
			File file = new File(org_file_name);
			f_msg_img.transferTo(file);
			FileUploadUtil.upload(file, msg_img);
			
			return result;
		} else {
			return "sendMsgImg_fail";
		}
	}
	
	

	// 안드로이드
	@RequestMapping(value="/android/sendMsgImg", method=RequestMethod.POST)
	@ResponseBody
	public String aSendMsgImg(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgImg(messageVo);
		return result;
	}
	
}
