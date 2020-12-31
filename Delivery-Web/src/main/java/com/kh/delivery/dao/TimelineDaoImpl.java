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

	@Override
	public void insertArticle(TimelineVo timelineVo) {
		
		System.out.println("TimelineDao, insertArticle, timelineVo:" + timelineVo);
		if(timelineVo.getTime_img() != null) {
			sqlSession.insert(NAMESPACE + "insertArticle", timelineVo);
		} else {
			sqlSession.insert(NAMESPACE + "insertArticleNoPic", timelineVo);
		}
		
	}

	@Override
	public List<TimelineVo> timelineList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "timelineList");
		return list;
	}

	@Override
	public void updateArticle(TimelineVo timelineVo) {
		
		sqlSession.update(NAMESPACE + "updateArticle", timelineVo);
		
	}

	@Override
	public void deleteArticle(int review_no) {
		sqlSession.update(NAMESPACE + "deleteArticle", review_no);
		
	}

	@Override
	public List<TimelineVo> timelineList2() {
		List<TimelineVo> timelineList = sqlSession.selectList(NAMESPACE + "timelineList");
		return timelineList;
	}

	@Override
	public String insertArticle2(TimelineVo timelineVo) {
		if(timelineVo.getTime_img() != null) {
			sqlSession.insert(NAMESPACE + "insertArticle", timelineVo);
		} else {
			sqlSession.insert(NAMESPACE + "insertArticleNoPic", timelineVo);
		}
		return "insertArticle_success";
	}

	@Override
	public String updateArticle2(TimelineVo timelineVo) {
		sqlSession.update(NAMESPACE + "updateArticle", timelineVo);
		return "updateArticle_success";
	}

	@Override
	public String deleteArticle2(int time_no) {
		sqlSession.update(NAMESPACE + "deleteArticle", time_no);
		return "deleteArticle_success";
	}
}
