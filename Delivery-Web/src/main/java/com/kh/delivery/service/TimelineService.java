package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;

public interface TimelineService {
	
	/* 글 리스트 */
	public List<TimelineVo> timelineList(int account_no, String searchType) throws Exception; 
	/*글 작성*/
	public String insertArticle(TimelineVo timelineVo) throws Exception;
	/*글 수정*/
	public String updateArticle(TimelineVo timelineVo) throws Exception;
	/*글 삭제*/
	public String deleteArticle(int time_no) throws Exception;
	/* 글 불러오기 */
	public TimelineVo selectByNo(int account_no, int time_no) throws Exception;
	// 글 작성 후 현재 페이지의 마지막 글번호 이후의 글 가져오기
	public List<TimelineVo> getCurrentTimeline(int account_no, int time_no) throws Exception;
//	안드로이드 마지막 글 불러오기
	public TimelineVo getLastTimeline() throws Exception;
}
