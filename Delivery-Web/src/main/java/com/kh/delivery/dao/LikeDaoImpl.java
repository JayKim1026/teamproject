package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.LikeVo;

@Repository
public class LikeDaoImpl implements LikeDao{
	
	private static final String NAMESPACE = "com.kh.delivery.like.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertLike(int time_no, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("user_id", user_id);
		
		sqlSession.insert(NAMESPACE  + "insertLike", map);
		
	}

	@Override
	public boolean isLike(int time_no, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("user_id", user_id);
		
		int count = sqlSession.insert(NAMESPACE + "isLike", map);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<LikeVo> likeList() {
		
		List<LikeVo> likeList = sqlSession.selectList(NAMESPACE + "likeList");
		
		return likeList;
	}
	
}
