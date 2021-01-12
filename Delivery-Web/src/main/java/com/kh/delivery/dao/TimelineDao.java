package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineDao {
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(String searchType) throws Exception; 
	/*글 작성*/
	public String insertArticle(TimelineVo timelineVo) throws Exception;
	/*글 수정*/
	public String updateArticle(TimelineVo timelineVo) throws Exception;
	/*글 삭제*/
	public String deleteArticle(int time_no) throws Exception;
	/* 글 불러오기 */
	public TimelineVo selectByNo(int time_no) throws Exception;
	/* Update Like */
	public void updateLikeCount(int time_like, int time_no) throws Exception;
	//	안드로이드 마지막 글 불러오기
	public TimelineVo getLastTimeline() throws Exception;
}
