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
	public List<TimelineVo> timelineList(String searchType) {
		List<TimelineVo> list = timelineDao.timelineList(searchType);
		return list;
	}

	@Override
	public String insertArticle(TimelineVo timelineVo) {
		String result = timelineDao.insertArticle(timelineVo);
		return result;
	}

	@Override
	public String updateArticle(TimelineVo timelineVo) {
		String result = timelineDao.updateArticle(timelineVo);
		return result;
	}

	@Override
	public String deleteArticle(int time_no) {
		String result = timelineDao.deleteArticle(time_no);
		return result;
	}

}
