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
	
	//일반회원 로그인
	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		UserVo userVo = userDao.login(user_id, user_pw);
		return userVo;
	}
	
	//일반회원 회원가입
	@Override
	public String registUser(UserVo userVo) throws Exception {
		String result = userDao.registUser(userVo);
		return result;
	}
	
	//일반회원 아이디 중복 확인
	@Override
	public boolean checkIdDupl(String user_id) throws Exception {
		boolean result = userDao.checkIdDupl(user_id);
		return result;
	}

	
	@Override
	public UserVo findAccount(String user_name, String user_phone, String user_email) throws Exception {
		UserVo userVo = userDao.findAccount(user_name, user_phone, user_email);
		return userVo;
	}
	
	
	@Override
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = userDao.getUserInfo(user_no);
		return userVo;
	}
	
	//일반회원 프로필 사진 변경
	@Override
	public String imgChange(String user_id, String chg_img) throws Exception {
		System.out.println("유저서비스 : " + user_id + " / " + chg_img );
		userDao.imgChange(user_id, chg_img);
		return "imgChange_success";
	}

	//일반회원 기존 비밀번호 확인
	@Override
	public String pwCheck(String user_id, String orgPw) throws Exception {
		String result = userDao.pwCheck(user_id, orgPw);
		//System.out.println("서비스 result pwCheck : " + result);
		return result;
	}

	//일반회원 비밀번호 변경
	@Override
	public String pwChange(String user_id, String chgPw) throws Exception {
		String result =	userDao.pwChange(user_id, chgPw);
		return result;
	}
	
	//일반 회원 이메일 변경
	@Override
	public String emailChange(String user_id, String chgEmail) throws Exception {
		String result = userDao.emailChange(user_id, chgEmail);
		return result;
	}
	
	//일반회원 휴대전화 변경
	@Override
	public String phoneChange(String user_id, String chgPhone) throws Exception {
		String result = userDao.phoneChange(user_id, chgPhone);
		return result;
	}

	//일반회원 주소 변경
	@Override
	public String addrChange(String user_id, String chgAddr) throws Exception {
		String result = userDao.addrChange(user_id, chgAddr);
		return result;
	}
	
	//일반회원 주문내역 조회 
	@Override
	public List<OrderVo> getOrderList(int user_no) throws Exception {
		List<OrderVo> orderList = userDao.getOrderList(user_no);
		return orderList;
	}

	@Override
	public List<UserVo> getUserRank() throws Exception {
		List<UserVo> userRank = userDao.getUserRank();
		return userRank;
	}

}
