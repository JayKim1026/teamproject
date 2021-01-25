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
	
	// 해당 주문의 메시지 리스트 조회
	@Override
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageDao.getMessageList(messageVo);
		return messageList;
	}
	// 현재 출력된 메시지 이후에 작성된 메시지 리스트 조회
	@Override
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = messageDao.getCurrentMessage(messageVo);
		return messageList;
	}
	// 메시지 보내기
	@Override
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		String result = messageDao.sendMsgContent(messageVo);
		return result;
	}
	// 이미지 보내기
	@Override
	public String sendMsgImg(MessageVo messageVo) throws Exception {
		String result = messageDao.sendMsgImg(messageVo);
		return result;
	}

}
