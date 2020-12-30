package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.TimelineDao;
import com.kh.delivery.domain.TimelineVo;

@Service
public class TimelineServiceImpl implements TimelineService {
	
	@Inject
	private TimelineDao timelineDao;
	
	@Override
	public TimelineVo insertArticle(TimelineVo timelineVo) {

		TimelineVo vo = timelineDao.insertArticle(timelineVo);
			
		return vo;
	}

	@Override
	public List<TimelineVo> timelineList() {
		
		List<TimelineVo> list = timelineDao.timelineList();
		return list;
	}

	@Override
	public void updateArticle(TimelineVo timelineVo) {
		timelineDao.updateArticle(timelineVo);
		
	}

	@Override
	public void deleteArticle(int review_no) {
		timelineDao.deleteArticle(review_no);
		
	}

}
