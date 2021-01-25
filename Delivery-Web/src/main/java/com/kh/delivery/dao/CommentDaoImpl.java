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
	
	/* 댓글 입력 
	 * commentVo
	 * c_content 댓글 내용
	 * writer_no 작성자 회원번호
	 * */
	@Override
	public String insertComment(CommentVo commentVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertComment", commentVo);
		return "insertComment_success";
	}

	/* 댓글 목록
	 * time_no 글번호
	 * 해당 글번호에 대한 댓글 목록만 불러옴.
	 * */
	@Override
	public List<CommentVo> getCommentList(int time_no) throws Exception {
		List<CommentVo> list = sqlSession.selectList(NAMESPACE + "getCommentList", time_no);
		return list;
	}

	/* 댓글 수정 
	 * c_content 수정될 내용
	 * c_no 수정할 댓글 번호
	 * */
	@Override
	public String updateComment(CommentVo commentVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateComment", commentVo);
		return "updateComment_success";
	}

	/* 댓글 삭제
	 * c_no 삭제할 댓글 번호
	 * */
	@Override
	public String deleteComment(int c_no) throws Exception {
		sqlSession.update(NAMESPACE + "deleteComment", c_no);
		return "deleteComment_success";
	}
	
	/* 댓글 작성 후 현재 출력된 댓글 이후 작성된 댓글 조회 */
	@Override
	public List<CommentVo> getCurrentComment(CommentVo commentVo) throws Exception {
		List<CommentVo> commentList = sqlSession.selectList(NAMESPACE + "getCurrentComment", commentVo);
		return commentList;
	}
	

}
