package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.AdminDao;
import com.kh.delivery.domain.AccountDto;
import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDao adminDao;
	
	/* Login 
	 * admin_id 관리자 아이디
	 * admin_pw 관리자 비밀번호
	 * */
	@Override
	public AdminVo login(String admin_id, String admin_pw) throws Exception{
		AdminVo adminVo = adminDao.login(admin_id, admin_pw);
		return adminVo;
	}
}
