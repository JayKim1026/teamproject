package com.kh.delivery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.TimelineDao;

@Service
public class TimelineServiceImpl implements TimelineService {
	
	@Inject
	private TimelineDao timelineDao;
	
	@Override
	public void insertArticle(int user_no, String review_content) {
		System.out.println("TimelineService, insertArticle, user_no:" + user_no);
		System.out.println("TimelineService, insertArticle, review_content:" + review_content);
		timelineDao.insertArticle(user_no, review_content);
			
	}

}
