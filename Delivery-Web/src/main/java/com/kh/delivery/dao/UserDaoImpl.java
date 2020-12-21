package com.kh.delivery.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	
	private final String NAMESPACE = "com.kh.delivery.user.";
	
	@Inject
	private SqlSession sqlSession;
	
	
}
