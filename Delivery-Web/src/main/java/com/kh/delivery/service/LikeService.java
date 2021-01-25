package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;

public interface LikeService {
	
	/* Insert Like
	 * time_no 해당 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	public String insertLike(int time_no, int account_no) throws Exception; 
	
	/* Delete Like
	 * time_no 해당 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	public String deleteLike(int time_no, int account_no) throws Exception;
	
	/* 해당 사용자가 좋아요를 이전에 눌렸었는지 확인 
	 * time_no 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	public boolean isLike(int time_no, int account_no) throws Exception;
	
	/* getLikeCount */
	public int getLikeCount(int time_no) throws Exception;
}
