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
	
	@Inject
	private TimelineDao timelineDao;
	
	@Override
	@Transactional
	public void insertLike(int time_no, String user_id) throws Exception {
	
		likeDao.insertLike(time_no, user_id);
		timelineDao.updateLikeCount(1, time_no);
		
	}

	@Override
	public void deleteLike(int time_no, String user_id) throws Exception {
		likeDao.deleteLike(time_no, user_id);
		
	}

	@Override
	public boolean isLike(int time_no, String user_id) throws Exception {
		boolean isLike = likeDao.isLike(user_id, time_no);
		return isLike;
	}
	
	

}
