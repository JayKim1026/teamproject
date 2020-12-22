package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	private final String NAMESPACE = "com.kh.delivery.user.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return userVo;
	}

	
}
