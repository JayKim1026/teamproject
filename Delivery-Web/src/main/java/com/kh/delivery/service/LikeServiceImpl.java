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
	
	@Override
	public String insertLike(int time_no, int account_no) throws Exception {
		String result = likeDao.insertLike(time_no, account_no);
		return result;
	}

	@Override
	public String deleteLike(int time_no, int account_no) throws Exception {
		String result = likeDao.deleteLike(time_no, account_no);
		return result;
	}

	@Override
	public boolean isLike(int time_no, int account_no) throws Exception {
		boolean isLike = likeDao.isLike(time_no, account_no);
		return isLike;
	}

	@Override
	public int getLikeCount(int time_no) throws Exception {
		int count = likeDao.getLikeCount(time_no);
		return count;
	}

}
