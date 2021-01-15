package com.kh.delivery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.AdminDao;
import com.kh.delivery.domain.AccountDto;
import com.kh.delivery.domain.AdminVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDao adminDao;

	@Override
	public AdminVo login(String admin_id, String admin_pw) {
		AdminVo adminVo = adminDao.login(admin_id, admin_pw);
		return adminVo;
	}

	@Override
	public int getMemberList() {
		int count = adminDao.getMemberList();
		return count;
	}

	

}
