package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineDao {
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(String searchType); 
	/*글 작성*/
	public String insertArticle(TimelineVo timelineVo);
	/*글 수정*/
	public String updateArticle(TimelineVo timelineVo);
	/*글 삭제*/
	public String deleteArticle(int time_no);
	/*따 봉!*/
	public void insertLike(int time_no, int time_like);
	/* 글 불러오기 */
	public TimelineVo selectByNo(int time_no);
	
}
