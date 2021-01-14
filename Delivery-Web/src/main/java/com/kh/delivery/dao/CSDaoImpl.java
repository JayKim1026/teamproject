package com.kh.delivery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.FAQVo;

@Repository
public class CSDaoImpl implements CSDao {

	private static final String NAMESPACE = "com.kh.delivery.CS.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<FAQVo> getFAQList() throws Exception {
		List<FAQVo> FAQList = sqlSession.selectList(NAMESPACE +"getFAQList");
		return FAQList;
	}
}
