package com.kh.delivery.dao;

import com.kh.delivery.domain.DeliverVo;

public interface DeliverDao {

	// 배달원 로그인
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;

	// 배달원 회원가입
	public String registDeliver(DeliverVo deliverVo) throws Exception;

	// 배달원 아이디 중복 확인
	public boolean checkIdDupl(String dlvr_id) throws Exception;

	// 배달원 프로필 사진 변경
	public String imgChange(String dlvr_id, String chg_img) throws Exception;

	// 배달원 현재 비밀번호 확인
	public String pwCheck(String dlvr_id, String dlvr_pw) throws Exception;

	// 배달원 비밀번호 변경
	public String pwChange(String dlvr_id, String chg_pw) throws Exception;

	// 배달원 이메일 변경
	public String emailChange(String dlvr_id, String chg_email) throws Exception;

	// 배달원 휴대전화 변경
	public String phoneChange(String dlvr_id, String chg_phone) throws Exception;

	// 배달원 주소 변경
	public String addrChange(String dlvr_id, String chg_addr) throws Exception;
	
	
	// 안드로이드
	// 배달원 정보 수정
	public String modifyDeliver(DeliverVo deliverVo) throws Exception;
	
		
}
