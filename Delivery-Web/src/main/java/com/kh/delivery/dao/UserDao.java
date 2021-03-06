package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.domain.UserVo;

public interface UserDao {
	
	// 웹
	// 로그인
	public UserVo login(String user_id, String user_pw) throws Exception;
	// 회원가입
	public String registUser(UserVo userVo) throws Exception;
	// 아이디 중복 확인
	public boolean checkIdDupl(String user_id) throws Exception;
	// 사용자 프로필 사진 변경
	public String imgChange(String user_id, String chg_img) throws Exception;
	// 사용자 현재 비밀번호 확인
	public String pwCheck(String user_id, String orgPw) throws Exception;
	// 사용자 비밀번호 변경
	public String pwChange(String user_id, String chgPw) throws Exception;
	// 사용자 이메일 변경
	public String emailChange(String user_id, String chgPhone) throws Exception;
	// 사용자 휴대전화 변경
	public String phoneChange(String user_id, String chg_phone) throws Exception;
	// 사용자 주소 변경
	public String addrChange(String user_id , String chgAddr) throws Exception;
	// 사용자 포인트 랭킹 조회
	public List<UserVo> getUserRank() throws Exception;

	// 안드로이드
	// 유저 정보 찾기
	public UserVo getUserInfo(int user_no) throws Exception;
	
	// 관리자
	// 새로 가입한 사용자 인원 조회
	public int getNewMemberCount() throws Exception;
	// 사용자 전체 인원 조회
	public int getTotalMemberCount() throws Exception;
	// 사용자 리스트 조회
	public List<UserVo> getMemberList() throws Exception;
	// 사용자 상태 변경
	public String userStateUpdate(int user_no, String user_state) throws Exception;
}
