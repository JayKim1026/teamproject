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
	private SqlSession sqlSession;
	
	// 포인트 입력
	@Override
	public String insertPoint(PointVo pointVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertPoint", pointVo);
		return "insertPoint_success";
	}
	// 내 포인트 기록 조회
	@Override
	public PointVo getMyPoint(int account_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("account_no", account_no);
		PointVo pointVo = sqlSession.selectOne(NAMESPACE + "getMyPoint", map);
		return pointVo;
	}
	// 사용자 포인트 리스트 조회
	@Override
	public List<PointVo> getUserPointList() throws Exception {
		List<PointVo> pointList = sqlSession.selectList(NAMESPACE + "getUserPointList");
		return pointList;
	}
	// 배달원  포인트 리스트 조회
	@Override
	public List<PointVo> getDlvrPointList() throws Exception {
		List<PointVo> pointList = sqlSession.selectList(NAMESPACE + "getDlvrPointList");
		return pointList;
	}

}
