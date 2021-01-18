package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.PointVo;

public interface PointDao {
	
	public String insertPoint(PointVo pointVo) throws Exception;
	public PointVo getMyPoint(int account_no) throws Exception;
	public List<PointVo> getUserPointList() throws Exception;
	public List<PointVo> getDlvrPointList() throws Exception;
	
}
