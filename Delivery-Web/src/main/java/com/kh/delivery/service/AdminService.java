package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;

public interface AdminService {
	
	/*Login
	 * admin_id 관리자 아이디
	 * admin_pw 관리자 비밀번호
	 * */
	public AdminVo login(String admin_id, String admin_pw) throws Exception;
}
