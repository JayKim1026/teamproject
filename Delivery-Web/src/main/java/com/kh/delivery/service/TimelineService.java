package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.LikeVo;
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
	/*따봉!*/
	public void insertLike(int time_no, String user_id);
	/*따봉체크!*/
	public boolean isLike(int time_no, String user_id);
	/*누가 따봉을 하였느냐*/
	public List<LikeVo> likeList();
	/* 글 불러오기 */
	public TimelineVo selectByNo(int time_no);
}
