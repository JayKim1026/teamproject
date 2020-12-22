package com.kh.delivery.dao;

import com.kh.delivery.domain.UserVo;

public interface UserDao {

	// 로그인
	public UserVo login(String user_id, String user_pw) throws Exception;
}
