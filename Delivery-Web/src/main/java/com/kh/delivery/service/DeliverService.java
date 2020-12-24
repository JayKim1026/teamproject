package com.kh.delivery.service;

import com.kh.delivery.domain.DeliverVo;

public interface DeliverService {
	
	// 로그인
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;

	// 회원가입
	public String registDeliver(DeliverVo deliverVo) throws Exception;

	// 아이디 중복 체크
	public boolean checkIdDupl(String dlvr_id) throws Exception;

	
}
