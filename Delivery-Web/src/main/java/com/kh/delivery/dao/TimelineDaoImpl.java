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
		
		sqlSession.insert(NAMESPACE + "insertArticle", timelineVo);
		
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
}
