package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.LikeDao;
import com.kh.delivery.dao.PointDao;
import com.kh.delivery.dao.TimelineDao;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.util.Codes;

@Service
public class TimelineServiceImpl implements TimelineService, Codes {
	
	@Inject
	private TimelineDao timelineDao;
	
	@Inject
	private PointDao pointDao;
	
	@Inject
	private AccountDao accountDao;

	@Override
	public List<TimelineVo> timelineList(int account_no, String searchType) throws Exception {
		List<TimelineVo> list = timelineDao.timelineList(account_no, searchType);
		return list;
	}

	@Override
	@Transactional
	public String insertArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineDao.insertArticle(timelineVo);
		System.out.println("TimelineService, insertArticle, timelineVo:" + timelineVo);
		PointVo pointVo = new PointVo(WRITE_TIMELINE, timelineVo.getWriter_no(), WRITE_COMMENT_POINT);
		pointDao.insertPoint(pointVo);
		accountDao.updatePoint(pointVo);
		return result;
	}

	@Override
	public String updateArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineDao.updateArticle(timelineVo);
		return result;
	}

	@Override
	public String deleteArticle(int time_no) throws Exception {
		String result = timelineDao.deleteArticle(time_no);
		return result;
	}

	@Override
	public TimelineVo selectByNo(int account_no, int time_no) throws Exception {
		TimelineVo timelineVo = timelineDao.selectByNo(account_no, time_no);
		return timelineVo;
	}

	@Override
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = timelineDao.getLastTimeline();
		return timelineVo;
	}

	@Override
	public List<TimelineVo> getCurrentTimeline(int account_no, int time_no) throws Exception {
		List<TimelineVo> timelineList = timelineDao.getCurrentTimeline(account_no, time_no);
		return timelineList;
	}
	

	
	/*----- 게시글 관련 카운트 -----*/
	/*신규 일반글*/
	@Override
	public int getNewPostCount() {
		int count = timelineDao.getNewPostCount();
		return count;
	}
	
	/*신규 리뷰*/
	@Override
	public int getNewReviewCount() {
		int count = timelineDao.getNewReviewCount();
		return count;
	}
	
	/*신규 공지*/
	@Override
	public int getNewNoticeCount() {
		int count = timelineDao.getNewNoticeCount();
		return count;
	}
	
	/*전체 일반글*/
	@Override
	public int getTotalPostCount() {
		int count = timelineDao.getTotalPostCount();
		return count;
	}
	
	/*전체 리뷰*/
	@Override
	public int getTotalReviewCount() {
		int count = timelineDao.getTotalReviewCount();
		return count;
	}
	/*----- 게시글 관련 카운트 끝 -----*/
	
	/*일반글 목록*/
	@Override
	public List<TimelineVo> getPostList() {
		List<TimelineVo> list = timelineDao.getPostList();
		return list;
	}
	
	/*리뷰 목록*/
	@Override
	public List<TimelineVo> getReviewList() {
		List<TimelineVo> list = timelineDao.getReviewList();
		return list;
	}
	
	/*공지 목록*/
	@Override
	public List<TimelineVo> getNoticeList() {
		List<TimelineVo> list = timelineDao.getNoticeList();
		return list;
	}

}
