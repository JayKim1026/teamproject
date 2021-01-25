package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.domain.TimelineVo;

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
		return "regist_success";
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
	public String pwCheck(String dlvr_id, String orgPw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("orgPw", orgPw);
		DeliverVo deliverVo= sqlSession.selectOne(NAMESPACE + "pwCheck", map);
		if(deliverVo != null) {
			return "true";
		} else {
			
			return "false";
		}
	}

	// 배달원 비밀번호 변경
	@Override
	public String pwChange(String dlvr_id, String chgPw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chgPw", chgPw);
		sqlSession.update(NAMESPACE + "pwChange", map);
		return "pwChange_success";
	}

	// 배달원 이메일 변경
	@Override
	public String emailChange(String dlvr_id, String chgEmail) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chgEmail", chgEmail);
		sqlSession.update(NAMESPACE + "emailChange", map);
		return "emailChange_success";
	}

	// 배달원 전화번호 변경
	@Override
	public String phoneChange(String dlvr_id, String chgPhone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chgPhone", chgPhone);
		sqlSession.update(NAMESPACE + "phoneChange", map);
		return "phoneChange_success";
	}
	
	// 배달원 주소 변경
	@Override
	public String addrChange(String dlvr_id, String chgAddr) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("chgAddr", chgAddr);
		sqlSession.update(NAMESPACE + "addrChange", map);
		return "addrChange_success";
	}

	
	/* 안드로이드*/ 
	@Override
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyDeliver", deliverVo);
		return "modify_deliver_success";
	}

	@Override
	public List<DeliverVo> getDlvrRank() throws Exception {
		List<DeliverVo> dlvrRank = sqlSession.selectList(NAMESPACE + "getDlvrRank");
		return dlvrRank;
	}
	
	// 관리자
	/* 신규 가입대기 배달원 */
	@Override
	public int getWaitingDeliveryCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getWaitingDeliveryCount");
		return count;
	}
	
	/* 신규 배달원 */
	@Override
	public int getNewDeliveryCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewDeliveryCount");
		return count;
	}

	/* 전체 배달원 */
	@Override
	public int getTotalDeliveryCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalDeliveryCount");
		return count;
	}
	
	/* 배달원 리스트 */
	@Override
	public List<DeliverVo> getDeliverList() {
		List<DeliverVo> list = sqlSession.selectList(NAMESPACE + "getDeliverList");
		return list;
	}
	
	/* 가입대기중 배달원 리스트 */
	@Override
	public List<DeliverVo> getWaitingDeliverList() {
		List<DeliverVo> list = sqlSession.selectList(NAMESPACE + "getWaitingDeliverList");
		return list;
	}

	@Override
	public String deliverStateUpdate(int dlvr_no, String dlvr_state) {
		Map<String, Object > map = new HashMap<>();
		map.put("dlvr_no", dlvr_no);
		map.put("dlvr_state", dlvr_state);
		sqlSession.update(NAMESPACE + "deliverStateUpdate", map);
		return "update_success";
	}

}
