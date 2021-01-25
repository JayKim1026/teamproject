package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.UserDao;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao userDao;
	
	// 웹
	// 사용자 로그인
	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		UserVo userVo = userDao.login(user_id, user_pw);
		return userVo;
	}
	// 사용자 회원가입
	@Override
	public String registUser(UserVo userVo) throws Exception {
		String result = userDao.registUser(userVo);
		return result;
	}
	// 사용자 아이디 중복 확인
	@Override
	public boolean checkIdDupl(String user_id) throws Exception {
		boolean result = userDao.checkIdDupl(user_id);
		return result;
	}
	// 사용자 프로필 사진 변경
	@Override
	public String imgChange(String user_id, String chg_img) throws Exception {
		userDao.imgChange(user_id, chg_img);
		return "imgChange_success";
	}
	// 사용자 기존 비밀번호 확인
	@Override
	public String pwCheck(String user_id, String orgPw) throws Exception {
		String result = userDao.pwCheck(user_id, orgPw);
		return result;
	}
	// 사용자 비밀번호 변경
	@Override
	public String pwChange(String user_id, String chgPw) throws Exception {
		String result =	userDao.pwChange(user_id, chgPw);
		return result;
	}
	// 사용자 이메일 변경
	@Override
	public String emailChange(String user_id, String chgEmail) throws Exception {
		String result = userDao.emailChange(user_id, chgEmail);
		return result;
	}
	// 사용자 휴대전화 변경
	@Override
	public String phoneChange(String user_id, String chgPhone) throws Exception {
		String result = userDao.phoneChange(user_id, chgPhone);
		return result;
	}
	// 사용자 주소 변경
	@Override
	public String addrChange(String user_id, String chgAddr) throws Exception {
		String result = userDao.addrChange(user_id, chgAddr);
		return result;
	}
	// 사용자 포인트 랭킹 조회
	@Override
	public List<UserVo> getUserRank() throws Exception {
		List<UserVo> userRank = userDao.getUserRank();
		return userRank;
	}

	// 안드로이드
	// 사용자 정보 조회
	@Override
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = userDao.getUserInfo(user_no);
		return userVo;
	}
	
	// 관리자
	// 새로 가입한 사용자 인원 조회
	@Override
	public int getNewMemberCount() throws Exception {
		int count = userDao.getNewMemberCount();
		return count;
	}
	// 사용자 전체 인원 조회
	@Override
	public int getTotalMemberCount() throws Exception {
		int count = userDao.getTotalMemberCount();
		return count;
	}
	// 사용자 리스트 조회
	@Override
	public List<UserVo> getMemberList() throws Exception {
		List<UserVo> list = userDao.getMemberList();
		return list;
	}
	// 사용자 상태 변경
	@Override
	public String userStateUpdate(int user_no, String user_state) throws Exception {
		String updateResult = userDao.userStateUpdate(user_no, user_state);
		return updateResult;
	}

}
