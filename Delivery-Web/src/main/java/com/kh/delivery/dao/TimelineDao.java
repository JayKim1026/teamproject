package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineDao {
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(); 
	
	/*글 작성*/
	public void insertArticle(TimelineVo timelineVo);

	
}
