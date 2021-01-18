package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.PointVo;

@Repository
public class PointDaoImpl implements PointDao {

	private static final String NAMESPACE = "com.kh.delivery.point.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public String insertPoint(PointVo pointVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertPoint", pointVo);
		return "insertPoint_success";
	}

	@Override
	public PointVo getMyPoint(int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("account_no", account_no);
		PointVo pointVo = sqlSession.selectOne(NAMESPACE + "getMyPoint", map);
		return pointVo;
	}

	@Override
	public List<PointVo> getUserPointList() throws Exception {
		List<PointVo> pointList = sqlSession.selectList(NAMESPACE + "getUserPointList");
		return pointList;
	}

	@Override
	public List<PointVo> getDlvrPointList() throws Exception {
		List<PointVo> pointList = sqlSession.selectList(NAMESPACE + "getDlvrPointList");
		return pointList;
	}

}
