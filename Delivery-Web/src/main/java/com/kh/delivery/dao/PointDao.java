package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.PointVo;

public interface PointDao {
	
	// 포인트 입력
	public String insertPoint(PointVo pointVo) throws Exception;
	// 내 포인트 기록 조회
	public PointVo getMyPoint(int account_no) throws Exception;
	// 사용자 포인트 리스트 조회
	public List<PointVo> getUserPointList() throws Exception;
	// 배달원 포인트 리스트 조회
	public List<PointVo> getDlvrPointList() throws Exception;
	
}
