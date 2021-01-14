package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.CommentDao;
import com.kh.delivery.domain.CommentVo;


@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDao commentDao;
	
	@Override
	public String insertComment(CommentVo commentVo) throws Exception {
		String result = commentDao.insertComment(commentVo);
		return result;
	}

	@Override
	public List<CommentVo> getCommentList(int time_no) throws Exception {
		List<CommentVo> list = commentDao.getCommentList(time_no);
		return list;
	}

	@Override
	public String updateComment(CommentVo commentVo) throws Exception {
		String result = commentDao.updateComment(commentVo);
		return result;
	}

	@Override
	public String deleteComment(int c_no) throws Exception {
		String result = commentDao.deleteComment(c_no);
		return result;
	}

	
}
