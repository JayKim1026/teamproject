package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.DeliverVo;

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


	@Override
	public String imgChange(String dlvr_id, String chg_img) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pwCheck(String dlvr_id, String chg_pw) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pwChange(String dlvr_id, String chg_Npw) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String emailChange(String dlvr_id, String chg_email) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String phoneChange(String dlvr_id, String chg_phone) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addrChange(String dlvr_id, String chg_addr) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/* // 웹*/ 
	
	
	
	/* 안드로이드*/ 
	@Override
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyDeliver", deliverVo);
		return "modify_deliver_success";
	}
	
}
