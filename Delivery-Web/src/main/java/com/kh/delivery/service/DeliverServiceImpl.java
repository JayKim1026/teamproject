package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.DeliverDao;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.TimelineVo;

@Service
public class DeliverServiceImpl implements DeliverService {

	@Inject
	DeliverDao deliverDao;
	
	// 배달원 로그인
	@Override
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverDao.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}
	
	// 배달원 회원가입
	@Override
	public String registDeliver(DeliverVo deliverVo) throws Exception {
		String result = deliverDao.registDeliver(deliverVo);
		return result;
	}

	// 배달원 아이디 중복체크
	@Override
	public boolean checkIdDupl(String dlvr_id) throws Exception {
		boolean result = deliverDao.checkIdDupl(dlvr_id);
		return result;
	}
	
	// 배달원 프로필 사진변경
	@Override
	public String imgChange(String dlvr_id, String chg_img) throws Exception {
		String result = deliverDao.imgChange(dlvr_id, chg_img);
		return result;
	}

	// 배달원 현재 비밀번호 확인
	@Override
	public String pwCheck(String dlvr_id, String dlvr_pw) throws Exception {
		String result = deliverDao.pwCheck(dlvr_id, dlvr_pw);
		return result;
	}

	// 배달원 비밀번호 변경
	@Override
	public String pwChange(String dlvr_id, String chg_pw) throws Exception {
		String result = deliverDao.pwChange(dlvr_id, chg_pw);
		return result;
	}
	
	// 배달원 이메일 변경
	@Override
	public String emailChange(String dlvr_id, String chg_email) throws Exception {
		String result = deliverDao.emailChange(dlvr_id, chg_email);
		return result;
	}

	// 배달원 휴대전화 변경
	@Override
	public String phoneChange(String dlvr_id, String chg_phone) throws Exception {
		String result = deliverDao.phoneChange(dlvr_id, chg_phone);
		return result;
	}

	// 배달원 주소 변경
	@Override
	public String addrChange(String dlvr_id, String chg_addr) throws Exception {
		String result = deliverDao.addrChange(dlvr_id, chg_addr);
		return result;
	}
	
	// 배달원 배달내역 조회
	@Override
	public List<OrderVo> getDeliveryList(int dlvr_no) throws Exception {
		List<OrderVo> deliveryList = deliverDao.getDeliveryList(dlvr_no);
		return deliveryList;
	}

	
	/*	//웹*/
	
	
	
	
	/*	안드로이드*/
	@Override
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		String result = deliverDao.modifyDeliver(deliverVo);
		return result;
	}

	
}
