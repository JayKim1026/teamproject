package com.kh.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.domain.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	private final String NAMESPACE = "com.kh.delivery.user.";
	
	@Inject
	private SqlSession sqlSession;
	
	//일반회원 로그인
	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "login", map);
		System.out.println("userDaoImpl : " + userVo);
		return userVo;
	}

	//일반회원 회원가입
	@Override
	public String registUser(UserVo userVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertUser", userVo);
		return "registSuccess";
	}

	//일반회원 아이디 중복확인
	@Override
	public boolean checkIdDupl(String user_id) throws Exception {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "checkIdDupl", user_id);
		if(userVo == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserVo findAccount(String user_name, String user_phone, String user_email) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("user_phone", user_phone);
		map.put("user_email", user_email);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "findAccount", map);
		return userVo;
	}

	@Override
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "getUserInfo", user_no);
		return userVo;
	}

	//일반회원 프로필 사진 변경
	@Override
	public String imgChange(String user_id, String chg_img) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chg_img", chg_img);
		//System.out.println("유저다오 imgChange : " + map);
		//System.out.println("유저다오 user_id : " + user_id);
		//System.out.println("유저다오 user_img : " + user_img);
		
		sqlSession.update(NAMESPACE + "imgChange", map);
				
		return "imgChange_success";
	}

	//일반회원 기존 비밀번호 확인
	@Override
	public String pwCheck(String user_id, String orgPw) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("orgPw", orgPw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "pwCheck" , map);
		//System.out.println("userDao pwCheck userVo : " + userVo);
		if(userVo != null) {
			return "true";
		} else {
			return "false";
		}
	}

	//일반회원 비밀번호 변경
	@Override
	public String pwChange(String user_id, String chgPw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgPw", chgPw);
		int result = sqlSession.update(NAMESPACE + "pwChange", map);
		System.out.println("pwChange Dao result" + result);	
		return "pwChange_success";
			
	}
	
	// 일반회원 이메일 변경
	@Override
	public String emailChange(String user_id, String chgEmail) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgEmail", chgEmail);
		int result = sqlSession.update(NAMESPACE + "emailChange" , map);
		System.out.println("emailChange Dao result : " + result);
		return "emailChange_success";
	}
	
	// 일반회원 휴대전화 변경
	@Override
	public String phoneChange(String user_id, String chgPhone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgPhone", chgPhone);
		int result = sqlSession.update(NAMESPACE + "phoneChange", map);
		System.out.println("phoneChange Dao result : " + result);
		return "phoneChange_success";
	}

	// 일반 회원 주소 변경
	@Override
	public String addrChange(String user_id , String chgAddr ) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgAddr", chgAddr);
		int result = sqlSession.update(NAMESPACE + "addrChange", map);
		System.out.println("addrChange Dao result : " + result);
		return "addrChange_success";
	}

	// 일반회원 주문내역 조회
	@Override
	public List<OrderVo> getOrderList(int user_no) throws Exception {
		List<OrderVo> orderList	= sqlSession.selectList(NAMESPACE + "getOrderList", user_no);
		System.out.println("userDaoImpl getOrderList : " + orderList);
		return orderList;
	}

	@Override
	public void updatePoint(PointVo pointVo) throws Exception {
		sqlSession.update(NAMESPACE + "updatePoint", pointVo);
	}
	
}
