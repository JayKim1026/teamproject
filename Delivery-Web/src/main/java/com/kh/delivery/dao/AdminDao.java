package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
public interface AdminDao {
	
	/* 신규 가입자 신규 기준은 하루*/
	
	/*Login*/
	public AdminVo login(String admin_id, String admin_pw);
	
}