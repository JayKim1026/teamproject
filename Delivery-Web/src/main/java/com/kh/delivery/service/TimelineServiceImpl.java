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
	public void insertArticle(TimelineVo timelineVo) {

		timelineDao.insertArticle(timelineVo);
			
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

	@Override
	public List<TimelineVo> timelineList2() {
		List<TimelineVo> list = timelineDao.timelineList();
		return list;
	}

	@Override
	public String insertArticle2(TimelineVo timelineVo) {
		String result = timelineDao.insertArticle2(timelineVo);
		return result;
	}

	@Override
	public String updateArticle2(TimelineVo timelineVo) {
		String result = timelineDao.updateArticle2(timelineVo);
		return result;
	}

	@Override
	public String deleteArticle2(int time_no) {
		String result = timelineDao.deleteArticle2(time_no);
		return result;
	}

}
