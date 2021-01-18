package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.PointDao;
import com.kh.delivery.domain.PointVo;

@Service
public class PointServiceImpl implements PointService {

	@Inject
	PointDao pointDao;
	
	@Override
	public String insertPoint(PointVo pointVo) throws Exception {
		String result = pointDao.insertPoint(pointVo);
		return result;
	}

	@Override
	public PointVo getMyPoint(int account_no) throws Exception {
		PointVo pointVo = pointDao.getMyPoint(account_no);
		return pointVo;
	}

	@Override
	public List<PointVo> getUserPointList() throws Exception {
		List<PointVo> pointList = pointDao.getUserPointList();
		return pointList;
	}

	@Override
	public List<PointVo> getDlvrPointList() throws Exception {
		List<PointVo> pointList = pointDao.getDlvrPointList();
		return pointList;
	}

}
