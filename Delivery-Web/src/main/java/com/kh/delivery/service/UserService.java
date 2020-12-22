package com.kh.delivery.service;

import com.kh.delivery.domain.UserVo;

public interface UserService {

	public UserVo login(String user_id, String user_pw) throws Exception;
}
