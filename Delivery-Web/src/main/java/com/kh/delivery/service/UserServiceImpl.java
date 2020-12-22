package com.kh.delivery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.UserDao;
import com.kh.delivery.domain.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao userDao;

	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		UserVo userVo = userDao.login(user_id, user_pw);
		return userVo;
	}

}
