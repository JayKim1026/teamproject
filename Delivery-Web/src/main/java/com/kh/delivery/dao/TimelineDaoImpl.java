package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.TimelineVo;

@Repository
public class TimelineDaoImpl implements TimelineDao {
	
	private static final String NAMESPACE = "com.kh.delivery.timeline."; 
	
	@Inject
	private SqlSession sqlSession;

	// 공용
	// 타임라인 리스트
	@Override
	public List<TimelineVo> timelineList(int account_no, String searchType) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("account_no", account_no);
		List<TimelineVo> timelineList = sqlSession.selectList(NAMESPACE + "timelineList", map);
		return timelineList;
	}
	// 타임라인 작성
	@Override
	public String insertArticle(TimelineVo timelineVo) throws Exception {
		if(timelineVo.getTime_img() != null) {
			sqlSession.insert(NAMESPACE + "insertArticle", timelineVo);
		} else {
			sqlSession.insert(NAMESPACE + "insertArticleNoPic", timelineVo);
		}
		return "insertArticle_success";
	}
	// 타임라인 수정
	@Override
	public String updateArticle(TimelineVo timelineVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateArticle", timelineVo);
		return "updateArticle_success";
	}
	// 타임라인 삭제
	@Override
	public String deleteArticle(int time_no) throws Exception {
		sqlSession.update(NAMESPACE + "deleteArticle", time_no);
		return "deleteArticle_success";
	}

	// 웹
	// 현재 타임라인 이후에 작성된 타임라인 목록 조회
	@Override
	public List<TimelineVo> getCurrentTimeline(int account_no, int time_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		List<TimelineVo> timelineList = sqlSession.selectList(NAMESPACE + "getCurrentTimeline", map);
		return timelineList;
	}

	// 안드로이드
	// 선택한 타임라인 조회
	@Override
	public TimelineVo selectByNo(int account_no, int time_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		TimelineVo timelineVo = sqlSession.selectOne(NAMESPACE + "selectByNo", map);
		return timelineVo;
	}
	// 최근 타임라인 1개 조회
	@Override
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = sqlSession.selectOne(NAMESPACE + "getLastTimeline");
		return timelineVo;
	}

	// 관리자
	/*----- 게시글 관련 카운트 -----*/
	/*신규 일반글*/
	@Override
	public int getNewPostCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewPostCount");
		return count;
	}
	/*신규 리뷰*/
	@Override
	public int getNewReviewCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewReviewCount");
		return count;
	}
	/*신규 공지*/
	@Override
	public int getNewNoticeCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewNoticeCount");
		return count;
	}
	/*전체 일반글*/
	@Override
	public int getTotalPostCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalPostCount");
		return count;
	}
	/*전체 리뷰*/
	@Override
	public int getTotalReviewCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalReviewCount");
		return count;
	}
	/*----- 게시글 관련 카운트 끝 -----*/
	
	/*----- 게시판(일반타임라인 + 리뷰 + 공지) 목록-----*/
	/*일반글 목록*/
	@Override
	public List<TimelineVo> getPostList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "getPostList");
		return list;
	}
	/*리뷰 목록*/
	@Override
	public List<TimelineVo> getReviewList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "getReviewList");
		return list;
	}
	/*공지 목록*/
	@Override
	public List<TimelineVo> getNoticeList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "getNoticeList");
		return list;
	}
	/*----- 게시판(일반타임라인 + 리뷰 + 공지) 목록 끝-----*/
	
}
