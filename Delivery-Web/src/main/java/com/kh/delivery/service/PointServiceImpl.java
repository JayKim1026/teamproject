package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.PointDao;
import com.kh.delivery.domain.PointVo;

@Service
public class PointServiceImpl implements PointService {

	@Inject
	private PointDao pointDao;
	
	// 포인트 입력
	@Override
	public String insertPoint(PointVo pointVo) throws Exception {
		String result = pointDao.insertPoint(pointVo);
		return result;
	}
	// 내 포인트 기록 조회
	@Override
	public PointVo getMyPoint(int account_no) throws Exception {
		PointVo pointVo = pointDao.getMyPoint(account_no);
		return pointVo;
	}
	// 사용자 포인트 리스트 조회
	@Override
	public List<PointVo> getUserPointList() throws Exception {
		List<PointVo> pointList = pointDao.getUserPointList();
		return pointList;
	}
	// 배달원 포인트 리스트 조회
	@Override
	public List<PointVo> getDlvrPointList() throws Exception {
		List<PointVo> pointList = pointDao.getDlvrPointList();
		return pointList;
	}

}
