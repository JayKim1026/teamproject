package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineService {
	
	/* 글작성 */
	public void insertArticle(TimelineVo timelineVo);
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(); 
}
