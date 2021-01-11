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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLike(int time_no, String user_id) {
		// TODO Auto-generated method stub
		
	}

	
}
