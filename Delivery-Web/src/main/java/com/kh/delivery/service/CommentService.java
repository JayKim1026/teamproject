package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.CommentVo;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;

public interface CommentService {
	
	/*Insert Comment*/
	public void insertComment(CommentVo commentVo);
	
	/*get CommentList*/
	public List<CommentVo> getCommentList(int time_no);
}
