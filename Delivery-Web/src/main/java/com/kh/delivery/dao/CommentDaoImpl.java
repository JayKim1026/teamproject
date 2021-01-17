package com.kh.delivery.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.CommentVo;



@Repository
public class CommentDaoImpl implements CommentDao{
	
	private static final String NAMESPACE = "com.kh.delivery.comment.";

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String insertComment(CommentVo commentVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertComment", commentVo);
		return "insertComment_success";
	}

	@Override
	public List<CommentVo> getCommentList(int time_no) throws Exception {
		List<CommentVo> list = sqlSession.selectList(NAMESPACE + "getCommentList", time_no);
		return list;
	}

	@Override
	public String updateComment(CommentVo commentVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateComment", commentVo);
		return "updateComment_success";
	}

	@Override
	public String deleteComment(int c_no) throws Exception {
		sqlSession.update(NAMESPACE + "deleteComment", c_no);
		return "deleteComment_success";
	}

	@Override
	public List<CommentVo> getCurrentComment(CommentVo commentVo) throws Exception {
		List<CommentVo> commentList = sqlSession.selectList(NAMESPACE + "getCurrentComment", commentVo);
		return commentList;
	}
	

}
