package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.MessageVo;

public interface MessageDao {
	// 해당 주문의 메시지 리스트 조회
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception;
	// 현재 출력된 메시지 이후에 작성된 메시지 조회
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception;
	// 메시지 보내기
	public String sendMsgContent(MessageVo messageVo) throws Exception;
	// 이미지 보내기
	public String sendMsgImg(MessageVo messageVo) throws Exception;
}
