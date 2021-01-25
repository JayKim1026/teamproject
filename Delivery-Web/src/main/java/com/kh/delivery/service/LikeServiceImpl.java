package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.LikeDao;
import com.kh.delivery.dao.TimelineDao;



@Service
public class LikeServiceImpl implements LikeService {
	
	@Inject
	private LikeDao likeDao;
	
	/* Insert Like
	 * time_no 해당 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	@Override
	public String insertLike(int time_no, int account_no) throws Exception {
		String result = likeDao.insertLike(time_no, account_no);
		return result;
	}
	
	/* Delete Like
	 * time_no 해당 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	@Override
	public String deleteLike(int time_no, int account_no) throws Exception {
		String result = likeDao.deleteLike(time_no, account_no);
		return result;
	}
	
	/* 해당 사용자가 좋아요를 이전에 눌렸었는지 확인 
	 * time_no 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	@Override
	public boolean isLike(int time_no, int account_no) throws Exception {
		boolean isLike = likeDao.isLike(time_no, account_no);
		return isLike;
	}
	
	/* getLikeCount */
	@Override
	public int getLikeCount(int time_no) throws Exception {
		int count = likeDao.getLikeCount(time_no);
		return count;
	}

}
