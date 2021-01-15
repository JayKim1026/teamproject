package com.kh.delivery.service;

import com.kh.delivery.domain.AdminVo;

public interface AdminService {

	public AdminVo login(String admin_id, String admin_pw);
}
