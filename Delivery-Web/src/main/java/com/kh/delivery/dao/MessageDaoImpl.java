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
	SqlSession sqlSession;

	@Override
	public List<MessageVo> getMessageList(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = sqlSession.selectList(NAMESPACE + "getMessageList", messageVo);
		return messageList;
	}

	@Override
	public List<MessageVo> getCurrentMessage(MessageVo messageVo) throws Exception {
		List<MessageVo> messageList = sqlSession.selectList(NAMESPACE + "getCurrentMessage", messageVo);
		return messageList;
	}

	@Override
	public String sendMsgContent(MessageVo messageVo) throws Exception {
		sqlSession.insert(NAMESPACE + "sendMsgContent", messageVo);
		return "sendMsgContent_success";
	}

	@Override
	public String sendMsgImg(MessageVo messageVo) throws Exception {
		sqlSession.insert(NAMESPACE + "sendMsgImg", messageVo);
		return "sendMsgImg_success";
	}

}
