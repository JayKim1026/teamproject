package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.MessageVo;

public interface MessageService {
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception;
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception;
	public String sendMsgContent(MessageVo messageVo) throws Exception;
	public String sendMsgImg(MessageVo messageVo) throws Exception;
}
