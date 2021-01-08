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
	public void insertComment(CommentVo commentVo) {
		sqlSession.insert(NAMESPACE + "insertComment", commentVo);
		
	}

	@Override
	public List<CommentVo> getCommentList(int time_no) {
		List<CommentVo> list = sqlSession.selectList(NAMESPACE + "getCommentList", time_no);
		return list;
	}
	

}
