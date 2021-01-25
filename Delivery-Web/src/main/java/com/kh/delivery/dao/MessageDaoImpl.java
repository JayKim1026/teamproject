package com.kh.delivery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.MessageVo;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	private static final String NAMESPACE = "com.kh.delivery.message.";
	
	@Inject
	private SqlSession sqlSession;

	// 해당 주문의 메시지 리스트 조회
	@Override
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = sqlSession.selectList(NAMESPACE + "getMessageList", messageVo);
		return messageList;
	}
	// 현재 출력된 메시지 이후에 작성된 메시지 리스트 조회
	@Override
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = sqlSession.selectList(NAMESPACE + "getCurrentMessage", messageVo);
		return messageList;
	}
	// 메시지 보내기
	@Override
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		sqlSession.insert(NAMESPACE + "sendMsgContent", messageVo);
		return "sendMsgContent_success";
	}
	// 이미지 보내기
	@Override
	public String sendMsgImg(MessageVo messageVo) throws Exception {
		sqlSession.insert(NAMESPACE + "sendMsgImg", messageVo);
		return "sendMsgImg_success";
	}

}
