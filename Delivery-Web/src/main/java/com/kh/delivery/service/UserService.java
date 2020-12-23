package com.kh.delivery.service;

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
	
	
	// 안드로이드
	// 유저 정보 찾기
	public UserVo getUserInfo(int user_no) throws Exception;
}
