package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.LikeVo;

public interface LikeDao {
	
	/* Insert Like*/
	public String insertLike(int time_no, int account_no) throws Exception; 
	
	/* Delete Like */
	public String deleteLike(int time_no, int account_no) throws Exception;
	
	/* isLike */
	public boolean isLike(int time_no, int account_no) throws Exception;
	
	/* getLikeCount */
	public int getLikeCount(int time_no) throws Exception;
	
}
