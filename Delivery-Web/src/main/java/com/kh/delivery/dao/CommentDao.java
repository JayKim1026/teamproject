package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.CommentVo;
import com.kh.delivery.domain.LikeVo;
public interface CommentDao {
	
	/* 댓글 입력 
	 * commentVo
	 * c_content 댓글 내용
	 * writer_no 작성자 회원번호
	 * */
	public String insertComment(CommentVo commentVo) throws Exception;
	
	/* 댓글 목록
	 * time_no 글번호
	 * 해당 글번호에 대한 댓글 목록만 불러옴.
	 * */
	public List<CommentVo> getCommentList(int time_no) throws Exception;
	
	/* 댓글 수정 
	 * c_content 수정될 내용
	 * c_no 수정할 댓글 번호
	 * */
	public String updateComment(CommentVo commentVo) throws Exception;
	
	/* 댓글 삭제
	 * c_no 삭제할 댓글 번호
	 * */
	public String deleteComment(int c_no) throws Exception;
	
	/* 댓글 작성 후 현재 출력된 댓글 이후 작성된 댓글 조회 */
	public List<CommentVo> getCurrentComment(CommentVo commentVo) throws Exception;
}
