package com.kh.delivery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao userDao;

	@Override
	public void loginRun() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
