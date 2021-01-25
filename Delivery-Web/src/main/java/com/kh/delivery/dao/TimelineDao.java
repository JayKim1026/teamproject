package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.TimelineVo;

public interface TimelineDao {
	
	// 공용
	/* 타임라인 리스트 */
	public List<TimelineVo> timelineList(int account_no, String searchType) throws Exception;
	/* 타임라인 작성*/
	public String insertArticle(TimelineVo timelineVo) throws Exception;
	/* 타임라인 수정*/
	public String updateArticle(TimelineVo timelineVo) throws Exception;
	/* 타임라인 삭제*/
	public String deleteArticle(int time_no) throws Exception;
	
	// 웹
	// 현재 타임라인 이후에 작성된 타임라인 목록 조회
	public List<TimelineVo> getCurrentTimeline(int account_no, int time_no) throws Exception;
	
	// 안드로이드 
	// 최근 타임라인 1개 조회
	public TimelineVo getLastTimeline() throws Exception;
	// 선택한 타임라인 조회
	public TimelineVo selectByNo(int account_no, int time_no) throws Exception;
	
	// 관리자
	/*----- 게시판 관련 카운트 -----*/
	/*신규 일반타임라인*/
	public int getNewPostCount();
	/*신규 리뷰*/
	public int getNewReviewCount();
	/*신규 공지*/
	public int getNewNoticeCount();
	/*전체 일반타임라인*/
	public int getTotalPostCount();
	/*전체 리뷰*/
	public int getTotalReviewCount();
	/*----- 게시판 관련 카운트 끝-----*/
	
	/*----- 게시판(일반타임라인 + 리뷰 + 공지) 목록-----*/
	/*일반타임라인 목록*/
	public List<TimelineVo> getPostList();
	/*리뷰 목록*/
	public List<TimelineVo> getReviewList();
	/*공지 목록*/
	public List<TimelineVo> getNoticeList();
	/*----- 게시판(일반타임라인 + 리뷰 + 공지) 목록 끝 -----*/
}
