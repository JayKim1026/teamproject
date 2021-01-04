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

	@Override
	public String registUser(UserVo userVo) throws Exception {
		String result = userDao.registUser(userVo);
		return result;
	}

	@Override
	public boolean checkIdDupl(String user_id) throws Exception {
		boolean result = userDao.checkIdDupl(user_id);
		return result;
	}

	@Override
	public UserVo findAccount(String user_name, String user_phone, String user_email) throws Exception {
		UserVo userVo = userDao.findAccount(user_name, user_phone, user_email);
		return userVo;
	}
	
	@Override
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = userDao.getUserInfo(user_no);
		return userVo;
	}

	@Override
	public String imgChange(String user_id, String user_img) throws Exception {
		System.out.println("유저서비스 : " + user_id + " / " + user_img );
		userDao.imgChange(user_id, user_img);
		return "imgChange_success";
	}

}
