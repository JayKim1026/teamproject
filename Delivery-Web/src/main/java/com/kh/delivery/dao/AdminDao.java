package com.kh.delivery.dao;

import com.kh.delivery.domain.AdminVo;

public interface AdminDao {
	
	public AdminVo login(String admin_id, String admin_pw);
	public int getMemberList();
	public int getWaitingDeliveryList();
	public int getDeliveryList();
}