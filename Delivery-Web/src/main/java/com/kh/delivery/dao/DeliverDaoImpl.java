package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;

@Repository
public class DeliverDaoImpl implements DeliverDao {

	private static final String NAMESPACE = "com.kh.delivery.deliver.";
	
	@Inject
	SqlSession sqlSession;

	// 배달원 로그인
	@Override
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("dlvr_pw", dlvr_pw);
		DeliverVo deliverVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return deliverVo;
	}

	// 배달원 회원가입
	@Override
	public String registDeliver(DeliverVo deliverVo) throws Exception {
		sqlSession.insert(NAMESPACE + "registDeliver", deliverVo );
		return "registSuccess";
	}
	
	// 배달원 아이디 중복 체크
	@Override
	public boolean checkIdDupl(String dlvr_id) throws Exception {
		DeliverVo deliverVo = sqlSession.selectOne(NAMESPACE + "checkIdDupl" , dlvr_id);
			if(deliverVo == null) {
				return true;
			} else {
				return false;
			}
	}


	// 배달원 프로필 사진 변경
	@Override
	public String imgChange(String dlvr_id, String chg_img) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chg_img", chg_img);
		sqlSession.update(NAMESPACE + "imgChange" , map);
		return "imgChange_success";
	}
	
	// 배달원 현재 비밀번호 확인
	@Override
	public String pwCheck(String dlvr_id, String dlvr_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("dlvr_pw", dlvr_pw);
		DeliverVo deliverVo= sqlSession.selectOne(NAMESPACE + "pwCheck", map);
		if(deliverVo != null) {
			return "true";
		} else {
			
			return "false";
		}
	}

	// 배달원 비밀번호 변경
	@Override
	public String pwChange(String dlvr_id, String chg_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chg_pw", chg_pw);
		sqlSession.update(NAMESPACE + "pwChange", map);
		return "pwChange_success";
	}

	// 배달원 이메일 변경
	@Override
	public String emailChange(String dlvr_id, String chg_email) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chg_email", chg_email);
		sqlSession.update(NAMESPACE + "emailChange", map);
		return "emailChange_success";
	}

	// 배달원 전화번호 변경
	@Override
	public String phoneChange(String dlvr_id, String chg_phone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chg_phone", chg_phone);
		sqlSession.update(NAMESPACE + "phoneChange", map);
		return "phoneChange_success";
	}
	
	// 배달원 주소 변경
	@Override
	public String addrChange(String dlvr_id, String chg_addr) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chg_addr", chg_addr);
		sqlSession.update(NAMESPACE + "addrChange", map);
		return "addrChange_success";
	}
	
	// 배달원 배달목록 조회
	@Override
	public List<OrderVo> getDeliveryList(int dlvr_no) throws Exception {
		System.out.println("딜리버 다오 : " + dlvr_no);
		List<OrderVo> deliveryList = sqlSession.selectList(NAMESPACE + "getDeliveryList", dlvr_no);
		return deliveryList;
	}
	
	/* // 웹*/ 
	
	
	
	/* 안드로이드*/ 
	@Override
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyDeliver", deliverVo);
		return "modify_deliver_success";
	}

	
}
