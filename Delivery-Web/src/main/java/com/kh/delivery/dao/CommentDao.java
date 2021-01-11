package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.CommentVo;
import com.kh.delivery.domain.LikeVo;

public interface CommentDao {
	
	/*Insert Comment*/
	public void insertComment(CommentVo commentVo);
	
	/*get CommentList*/
	public List<CommentVo> getCommentList(int time_no); 
	
	/*Update Comment*/
	public void updateComment(CommentVo commentVo);
	
	/*Delete Comment*/
	public void deleteComment(int c_no);
}
