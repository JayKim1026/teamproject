package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;

public interface LikeService {
	
	/* Insert Like*/
	public void insertLike(int time_no, String user_id) throws Exception; 
	
	/* Delete Like */
	public void deleteLike(int time_no, String user_id) throws Exception;
	
	/* isLike */
	public boolean isLike(int time_no, String user_id) throws Exception;
}
