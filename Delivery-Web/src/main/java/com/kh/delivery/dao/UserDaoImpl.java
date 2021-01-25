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
	
	// 사용자 로그인
	@Override
	public UserVo login(String user_id, String user_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return userVo;
	}
	// 사용자 회원가입
	@Override
	public String registUser(UserVo userVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertUser", userVo);
		return "registSuccess";
	}
	// 사용자 아이디 중복확인
	@Override
	public boolean checkIdDupl(String user_id) throws Exception {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "checkIdDupl", user_id);
		if(userVo == null) {
			return true;
		} else {
			return false;
		}
	}
	// 사용자 프로필 사진 변경
	@Override
	public String imgChange(String user_id, String chg_img) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chg_img", chg_img);
		sqlSession.update(NAMESPACE + "imgChange", map);
		return "imgChange_success";
	}
	// 사용자 기존 비밀번호 확인
	@Override
	public String pwCheck(String user_id, String orgPw) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("orgPw", orgPw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "pwCheck" , map);
		if(userVo != null) {
			return "true";
		} else {
			return "false";
		}
	}
	// 사용자 비밀번호 변경
	@Override
	public String pwChange(String user_id, String chgPw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgPw", chgPw);
		sqlSession.update(NAMESPACE + "pwChange", map);
		return "pwChange_success";
	}
	// 사용자 이메일 변경
	@Override
	public String emailChange(String user_id, String chgEmail) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgEmail", chgEmail);
		sqlSession.update(NAMESPACE + "emailChange" , map);
		return "emailChange_success";
	}
	// 사용자 휴대전화 변경
	@Override
	public String phoneChange(String user_id, String chgPhone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgPhone", chgPhone);
		sqlSession.update(NAMESPACE + "phoneChange", map);
		return "phoneChange_success";
	}
	// 사용자 주소 변경
	@Override
	public String addrChange(String user_id , String chgAddr ) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("chgAddr", chgAddr);
		sqlSession.update(NAMESPACE + "addrChange", map);
		return "addrChange_success";
	}
	// 사용자 포인트 랭킹 조회
	@Override
	public List<UserVo> getUserRank() throws Exception {
		List<UserVo> userRank = sqlSession.selectList(NAMESPACE + "getUserRank");
		return userRank;
	}
	
	// 안드로이드
	// 사용자 정보 조회
	@Override
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "getUserInfo", user_no);
		return userVo;
	}
	
	// 관리자
	// 새로 가입한 사용자 인원 조회
	@Override
	public int getNewMemberCount() throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "getNewMemberCount");
		return count;
	}
	// 사용자 전체 인원 조회
	@Override
	public int getTotalMemberCount() throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalMemberCount");
		return count;
	}
	// 사용자 리스트 조회
	@Override
	public List<UserVo> getMemberList() throws Exception {
		List<UserVo> list = sqlSession.selectList(NAMESPACE + "getMemberList");
		return list;
	}
	// 사용자 상태 변경
	@Override
	public String userStateUpdate(int user_no, String user_state) throws Exception {
		Map<String, Object > map = new HashMap<>();
		map.put("user_no", user_no);
		map.put("user_state", user_state);
		sqlSession.update(NAMESPACE + "userStateUpdate", map);
		return "update_success";
	}
	
}
