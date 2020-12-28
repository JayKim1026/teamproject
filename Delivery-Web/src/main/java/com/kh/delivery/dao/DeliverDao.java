package com.kh.delivery.dao;

import com.kh.delivery.domain.DeliverVo;

public interface DeliverDao {

	// 배달원 로그인
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;
	
	// 배달원 회원가입 
	public String registDeliver(DeliverVo deliverVo) throws Exception;
	
	// 배달원 아이디 중복 확인
	public boolean checkIdDupl(String dlvr_id) throws Exception;
	
}
