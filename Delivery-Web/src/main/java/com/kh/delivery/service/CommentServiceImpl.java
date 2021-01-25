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
	
	/* 댓글 입력 
	 * commentVo
	 * c_content 댓글 내용
	 * writer_no 작성자 회원번호
	 * */
	@Override
	@Transactional
	public String insertComment(CommentVo commentVo) throws Exception {
		String result = commentDao.insertComment(commentVo);
		PointVo pointVo = new PointVo(WRITE_COMMENT, commentVo.getWriter_no(), WRITE_COMMENT_POINT);
		pointDao.insertPoint(pointVo);
		accountDao.updatePoint(pointVo);
		return result;
	}

	/* 댓글 목록
	 * time_no 글번호
	 * 해당 글번호에 대한 댓글 목록만 불러옴.
	 * */
	@Override
	public List<CommentVo> getCommentList(int time_no) throws Exception {
		List<CommentVo> list = commentDao.getCommentList(time_no);
		return list;
	}

	/* 댓글 수정 
	 * c_content 수정될 내용
	 * c_no 수정할 댓글 번호
	 * */
	@Override
	public String updateComment(CommentVo commentVo) throws Exception {
		String result = commentDao.updateComment(commentVo);
		return result;
	}

	/* 댓글 삭제
	 * c_no 삭제할 댓글 번호
	 * */
	@Override
	public String deleteComment(int c_no) throws Exception {
		String result = commentDao.deleteComment(c_no);
		return result;
	}

	/* 댓글 작성 후 현재 출력된 댓글 이후 작성된 댓글 조회 */
	@Override
	public List<CommentVo> getCurrentComment(CommentVo commentVo) throws Exception {
		List<CommentVo> commentList = commentDao.getCurrentComment(commentVo);
		return commentList;
	}

	
}
