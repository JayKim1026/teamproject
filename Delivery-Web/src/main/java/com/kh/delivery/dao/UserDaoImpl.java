package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	private final String NAMESPACE = "com.kh.delivery.user.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "login", map);
		System.out.println("userDaoImpl : " + userVo);
		return userVo;
	}

	@Override
	public String registUser(UserVo userVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertUser", userVo);
		return "registSuccess";
	}

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

	@Override
	public String imgChange(String user_id, String user_img) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_img", user_img);
		System.out.println("유저다오 imgChange : " + map);
		System.out.println("유저다오 user_id : " + user_id);
		System.out.println("유저다오 user_img : " + user_img);
		
		sqlSession.update(NAMESPACE + "imgChange", map);
				
		return "imgChange_success";
	}

	@Override
	public String pwCheck(String user_id, String user_pw) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "pwCheck" , map);
		//System.out.println("userDao pwCheck userVo : " + userVo);
		if(userVo != null) {
			return "true";
		} else {
			return "false";
		}
	}

	@Override
	public String pwChange(String user_id, String user_Npw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_Npw", user_Npw);
		int result = sqlSession.update(NAMESPACE + "pwChange", map);
		System.out.println("pwChange Dao result" + result);	
		return "pwChange_success";
			
	}

	@Override
	public String emailChange(String user_id, String user_email) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		int result = sqlSession.update(NAMESPACE + "emailChange" , map);
		System.out.println("emailChange Dao result : " + result);
		return "emailChange_success";
	}

	@Override
	public String phoneChange(String user_id, String chg_phone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chg_phone", chg_phone);
		int result = sqlSession.update(NAMESPACE + "phoneChange", map);
		System.out.println("phoneChange Dao result : " + result);
		return "phoneChange_success";
	}

	@Override
	public String addrChange(String chg_addr, String user_id) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chg_addr", chg_addr);
		int result = sqlSession.update(NAMESPACE + "addrChange", map);
		System.out.println("addrChange Dao result : " + result);
		return "addrChange_success";
	}
	
}
