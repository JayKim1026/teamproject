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
	private SqlSession sqlSession;
	
	/* Insert Like
	 * time_no 해당 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	@Override
	public String insertLike(int time_no, int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		
		sqlSession.insert(NAMESPACE + "insertLike", map);
		return "insertLike_success";
	}
	
	/* Delete Like
	 * time_no 해당 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
	@Override
	public String deleteLike(int time_no, int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		map.put("account_no", account_no);
		
		sqlSession.insert(NAMESPACE + "deleteLike", map);
		return "deleteLike_success";
	}
	
	/* 해당 사용자가 좋아요를 이전에 눌렸었는지 확인 
	 * time_no 글 번호
	 * account_no 로그인되어있는 사용자 번호
	 * */
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
	
	/* getLikeCount */
	@Override
	public int getLikeCount(int time_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("time_no", time_no);
		int count = sqlSession.selectOne(NAMESPACE + "getLikeCount", map);
		return count;
	}

}
