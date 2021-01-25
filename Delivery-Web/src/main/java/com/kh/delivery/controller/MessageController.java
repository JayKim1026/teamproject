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
// 완료
	@Inject
	private MessageService messageService;

	// 공용
	// 해당 주문의 메시지 리스트 조회
	@RequestMapping(value="/getMessageList", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageService.getMessageList(messageVo);
		return messageList;
	}
	// 현재 출력된 메시지 이후에 작성된 메시지 리스트 조회
	@RequestMapping(value="/getCurrentMessage", method=RequestMethod.POST)
	@ResponseBody
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageService.getCurrentMessage(messageVo);
		return messageList;
	}
	// 메시지 보내기
	@RequestMapping(value="/sendMsgContent", method=RequestMethod.POST)
	@ResponseBody
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgContent(messageVo);
		return result;
	}
	
	// 웹
	// 이미지 보내기
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
	// 이미지 보내기
	@RequestMapping(value="/android/sendMsgImg", method=RequestMethod.POST)
	@ResponseBody
	public String aSendMsgImg(MessageVo messageVo) throws Exception {
		String result = messageService.sendMsgImg(messageVo);
		return result;
	}
	
}
