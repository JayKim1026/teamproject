package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.LikeDao;
import com.kh.delivery.dao.PointDao;
import com.kh.delivery.dao.TimelineDao;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.util.Codes;

@Service
public class TimelineServiceImpl implements TimelineService, Codes {
	
	@Inject
	private TimelineDao timelineDao;
	
	@Inject 
	private LikeDao likeDao;
	
	@Inject
	private PointDao pointDao;
	
	@Inject
	private AccountDao accountDao;

	@Override
	public List<TimelineVo> timelineList(String searchType) throws Exception {
		List<TimelineVo> list = timelineDao.timelineList(searchType);
		return list;
	}

	@Override
	@Transactional
	public String insertArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineDao.insertArticle(timelineVo);
		System.out.println("TimelineService, insertArticle, timelineVo:" + timelineVo);
		PointVo pointVo = new PointVo(WRITE_TIMELINE, timelineVo.getWriter_no(), WRITE_COMMENT_POINT);
		pointDao.insertPoint(pointVo);
		accountDao.updatePoint(pointVo);
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
	public TimelineVo selectByNo(int time_no) throws Exception {
		TimelineVo timelineVo = timelineDao.selectByNo(time_no);
		int likeCount = likeDao.getLikeCount(time_no);
		timelineVo.setTime_like(likeCount);
		return timelineVo;
	}

	@Override
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = timelineDao.getLastTimeline();
		return timelineVo;
	}

	@Override
	public List<TimelineVo> getCurrentTimeline(int time_no) throws Exception {
		List<TimelineVo> timelineList = timelineDao.getCurrentTimeline(time_no);
		return timelineList;
	}

}
