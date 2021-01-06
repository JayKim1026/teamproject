package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.LikeVo;

public interface LikeDao {
	/*따봉!*/
	public void insertLike(int time_no, String user_id);
	
	/*따봉 확인!*/
	public boolean isLike(int time_no, String user_id);
	
	/*누구인가?누가 따봉을 하였는가?*/
	public List<LikeVo> likeList();
}
