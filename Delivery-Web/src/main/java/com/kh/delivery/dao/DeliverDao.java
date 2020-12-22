package com.kh.delivery.dao;

import com.kh.delivery.domain.DeliverVo;

public interface DeliverDao {
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;
}
