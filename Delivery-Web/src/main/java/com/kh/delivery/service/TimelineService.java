package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineService {
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(String searchType); 
	/*글 작성*/
	public String insertArticle(TimelineVo timelineVo);
	/*글 수정*/
	public String updateArticle(TimelineVo timelineVo);
	/*글 삭제*/
	public String deleteArticle(int time_no);
}
