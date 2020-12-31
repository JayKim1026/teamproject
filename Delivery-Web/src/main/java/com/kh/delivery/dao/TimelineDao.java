package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineDao {
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(); 
	
	/*글 작성*/
	public void insertArticle(TimelineVo timelineVo);

	/*글 수정*/
	public void updateArticle(TimelineVo timelineVo);
	
	/*글 삭제*/
	public void deleteArticle(int review_no);
	

	// 수정본
	/* 글 리스트 */
	public List<TimelineVo> timelineList2(); 
	/*글 작성*/
	public String insertArticle2(TimelineVo timelineVo);
	/*글 수정*/
	public String updateArticle2(TimelineVo timelineVo);
	/*글 삭제*/
	public String deleteArticle2(int time_no);
}
