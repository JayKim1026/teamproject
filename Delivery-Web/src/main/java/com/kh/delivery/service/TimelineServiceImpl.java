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

}
