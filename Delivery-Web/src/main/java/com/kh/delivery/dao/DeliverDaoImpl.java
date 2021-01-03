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
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyDeliver", deliverVo);
		return "modify_deliver_success";
	}

	@Override
	public String updateDlvrImg(int dlvr_no, String dlvr_img) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("dlvr_no", dlvr_no);
		map.put("dlvr_img", dlvr_img);
		sqlSession.update(NAMESPACE + "updateDlvrImg", map);
		return "updateDlvrImg_success";
	}

}
