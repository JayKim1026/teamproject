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

	@Override
	public String registUser(UserVo userVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertUser", userVo);
		return "regist_success";
	}

	@Override
	public boolean checkIdDupl(String user_id) throws Exception {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "checkIdDupl", user_id);
		if(userVo == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserVo findAccount(String user_name, String user_phone, String user_email) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("user_phone", user_phone);
		map.put("user_email", user_email);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "findAccount", map);
		return userVo;
	}

	@Override
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "getUserInfo", user_no);
		return userVo;
	}

	
}
