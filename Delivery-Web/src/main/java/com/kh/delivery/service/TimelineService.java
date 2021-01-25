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
	
	// 관리자
	
	/*----- 게시판 관련 카운트 -----*/
	/*신규 일반글*/
	public int getNewPostCount();
	/*신규 리뷰*/
	public int getNewReviewCount();
	/*신규 공지*/
	public int getNewNoticeCount();
	/*전체 일반글*/
	public int getTotalPostCount();
	/*전체 리뷰*/
	public int getTotalReviewCount();
	/*----- 게시판 관련 카운트 끝-----*/
	
	/*----- 게시판(일반글 + 리뷰 + 공지) 목록 + 글 삭제-----*/
	/*일반글 목록*/
	public List<TimelineVo> getPostList();
	/*리뷰 목록*/
	public List<TimelineVo> getReviewList();
	/*공지 목록*/
	public List<TimelineVo> getNoticeList();
	/*----- 게시판(일반글 + 리뷰 + 공지) 목록 + 글 삭제 끝 -----*/
}
