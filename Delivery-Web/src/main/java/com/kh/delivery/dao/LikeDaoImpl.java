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
	public String insertLike(int time_no, int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		
		sqlSession.insert(NAMESPACE + "insertLike", map);
		return "insertLike_success";
	}

	@Override
	public String deleteLike(int time_no, int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		
		sqlSession.insert(NAMESPACE + "deleteLike", map);
		return "deleteLike_success";
	}

	@Override
	public boolean isLike(int time_no, int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		int count = sqlSession.selectOne(NAMESPACE + "isLike", map);
		if(count > 0 ) {
			return true;
		}
		return false;
	}

	@Override
	public int getLikeCount(int time_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		int count = sqlSession.selectOne(NAMESPACE + "getLikeCount", map);
		return count;
	}

}
