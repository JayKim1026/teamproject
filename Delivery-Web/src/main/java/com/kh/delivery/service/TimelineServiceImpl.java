package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.LikeDao;
import com.kh.delivery.dao.TimelineDao;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;

@Service
public class TimelineServiceImpl implements TimelineService {
	
	@Inject
	private TimelineDao timelineDao;
	
	@Inject 
	private LikeDao likeDao;

	@Override
	public List<TimelineVo> timelineList(String searchType) throws Exception {
		List<TimelineVo> list = timelineDao.timelineList(searchType);
		return list;
	}

	@Override
	public String insertArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineDao.insertArticle(timelineVo);
		System.out.println("TimelineService, insertArticle, timelineVo:" + timelineVo);
		return result;
	}

	@Override
	public String updateArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineDao.updateArticle(timelineVo);
		return result;
	}

	@Override
	public String deleteArticle(int time_no) throws Exception {
		String result = timelineDao.deleteArticle(time_no);
		return result;
	}

	@Override
	@Transactional
	public void insertLike(int time_no, String user_id) throws Exception {
		
		int time_like = 1;
		
		timelineDao.insertLike(time_no, time_like);
		likeDao.insertLike(time_no, user_id);
		
	}

	@Override
	public boolean isLike(int time_no, String user_id) throws Exception {
		
		boolean isLike = likeDao.isLike(time_no, user_id);
		
		return isLike;
	}

	@Override
	public List<LikeVo> likeList() throws Exception {
		
		List<LikeVo> likeList = likeDao.likeList();
		return likeList;
	}

	@Override
	public TimelineVo selectByNo(int time_no) throws Exception {
		TimelineVo timelineVo = timelineDao.selectByNo(time_no);
		return timelineVo;
	}

	@Override
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = timelineDao.getLastTimeline();
		return timelineVo;
	}

}
