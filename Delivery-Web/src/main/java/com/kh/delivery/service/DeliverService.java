package com.kh.delivery.service;

import com.kh.delivery.domain.DeliverVo;

public interface DeliverService {
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;
}
