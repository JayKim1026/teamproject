package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.LikeVo;

public interface LikeDao {
	
	/* Insert Like*/
	public void insertLike(int time_no, String user_id); 
	
	/* Delete Like */
	public void deleteLike(int time_no, String user_id);
}
