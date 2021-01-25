package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	private final static String NAMESPACE = "com.kh.delivery.admin.";
	
	@Inject
	SqlSession sqlSession;
	
	/* Login 
	 * admin_id 관리자 아이디
	 * admin_pw 관리자 패스워드
	 * */
	@Override
	public AdminVo login(String admin_id, String admin_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("admin_id", admin_id);
		map.put("admin_pw", admin_pw);
		AdminVo adminVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return adminVo;
	}
}
