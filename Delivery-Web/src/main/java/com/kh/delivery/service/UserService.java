package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;

public interface UserService {

	// 로그인
	public UserVo login(String user_id, String user_pw) throws Exception;

	// 회원가입
	public String registUser(UserVo userVo) throws Exception;

	// 아이디 중복 체크
	public boolean checkIdDupl(String user_id) throws Exception;

	// 사용자 아이디 비밀번호 찾기
	public UserVo findAccount(String user_name, String user_phone, String user_email) throws Exception;
	
	// 사용자 프로필 사진 변경
	public String imgChange(String user_id, String chg_img) throws Exception;

	// 사용자 기존 비밀번호 확인
	public String pwCheck(String user_id, String orgPw) throws Exception;

	// 사용자 비밀번호 변경
	public String pwChange(String user_id, String chgPw) throws Exception;
	
	// 사용자 이메일 변경
	public String emailChange(String user_id, String chgEmail) throws Exception;
	
	// 사용자 전화번호 변경
	public String phoneChange(String user_id, String chgPhone) throws Exception;

	// 사용자 주소 변경
	public String addrChange(String user_id, String chgAddr) throws Exception;
	
	// 사용자 주문 내역 조회
	public List<OrderVo> getOrderList(int user_no) throws Exception; 
	
	public List<UserVo> getUserRank() throws Exception;
	
	// 안드로이드
	// 유저 정보 찾기
	public UserVo getUserInfo(int user_no) throws Exception;


}
