package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.MessageDao;
import com.kh.delivery.domain.MessageVo;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	MessageDao messageDao;
	
	@Override
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageDao.getMessageList(messageVo);
		return messageList;
	}

	@Override
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageDao.getCurrentMessage(messageVo);
		return messageList;
	}

	@Override
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		String result = messageDao.sendMsgContent(messageVo);
		return result;
	}

	@Override
	public String sendMsgImg(MessageVo messageVo) throws Exception {
		String result = messageDao.sendMsgImg(messageVo);
		return result;
	}

}
