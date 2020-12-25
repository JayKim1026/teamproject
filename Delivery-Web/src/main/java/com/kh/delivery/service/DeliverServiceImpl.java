package com.kh.delivery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.DeliverDao;
import com.kh.delivery.domain.DeliverVo;

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
		// TODO Auto-generated method stub
		return false;
	}

}
