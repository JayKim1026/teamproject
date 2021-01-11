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
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
		
	}

	@Override
	public List<CommentVo> getCommentList(int time_no) {
		List<CommentVo> list = commentDao.getCommentList(time_no);
		return list;
	}

	@Override
	public void updateComment(CommentVo commentVo) {
		commentDao.updateComment(commentVo);
		
	}

	@Override
	public void deleteComment(int c_no) {
		commentDao.deleteComment(c_no);
		
	}

	
}
