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
	public List<TimelineVo> timelineList(String searchType) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		List<TimelineVo> timelineList = sqlSession.selectList(NAMESPACE + "timelineList", map);
		return timelineList;
	}

	@Override
	public String insertArticle(TimelineVo timelineVo) {
		if(timelineVo.getTime_img() != null) {
			sqlSession.insert(NAMESPACE + "insertArticle", timelineVo);
		} else {
			sqlSession.insert(NAMESPACE + "insertArticleNoPic", timelineVo);
			System.out.println("TimelineDao, insertArticle, timelineVo:" + timelineVo);
		}
		return "insertArticle_success";
	}

	@Override
	public String updateArticle(TimelineVo timelineVo) {
		sqlSession.update(NAMESPACE + "updateArticle", timelineVo);
		return "updateArticle_success";
	}

	@Override
	public String deleteArticle(int time_no) {
		sqlSession.update(NAMESPACE + "deleteArticle", time_no);
		return "deleteArticle_success";
	}
}
