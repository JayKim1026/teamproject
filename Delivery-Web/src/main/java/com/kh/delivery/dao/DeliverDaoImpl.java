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
	
	@Override
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", dlvr_id);
		map.put("dlvr_pw", dlvr_pw);
		DeliverVo deliverVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return deliverVo;
	}

}
