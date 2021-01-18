package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.CommentDao;
import com.kh.delivery.dao.PointDao;
import com.kh.delivery.domain.CommentVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.util.Codes;


@Service
public class CommentServiceImpl implements CommentService, Codes {

	@Inject
	private CommentDao commentDao;
	
	@Inject
	private PointDao pointDao;
	
	@Inject
	private AccountDao accountDao;
	
	@Override
	@Transactional
	public String insertComment(CommentVo commentVo) throws Exception {
		String result = commentDao.insertComment(commentVo);
		PointVo pointVo = new PointVo(WRITE_COMMENT, commentVo.getWriter_no(), WRITE_COMMENT_POINT);
		pointDao.insertPoint(pointVo);
		accountDao.updatePoint(pointVo);
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

	@Override
	public List<CommentVo> getCurrentComment(CommentVo commentVo) throws Exception {
		List<CommentVo> commentList = commentDao.getCurrentComment(commentVo);
		return commentList;
	}

	
}
