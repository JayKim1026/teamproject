package com.kh.delivery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.DeliverDao;
import com.kh.delivery.domain.DeliverVo;

@Service
public class DeliverServiceImpl implements DeliverService {

	@Inject
	DeliverDao deliverDao;
	
	@Override
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverDao.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}

}
