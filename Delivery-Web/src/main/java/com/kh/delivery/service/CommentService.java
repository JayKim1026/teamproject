package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.CommentVo;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;

public interface CommentService {
	
	/*Insert Comment*/
	public String insertComment(CommentVo commentVo) throws Exception;
	
	/*get CommentList*/
	public List<CommentVo> getCommentList(int time_no) throws Exception;
	
	/*Update Comment*/
	public String updateComment(CommentVo commentVo) throws Exception;
	
	/*Delete Comment*/
	public String deleteComment(int c_no) throws Exception;
}
