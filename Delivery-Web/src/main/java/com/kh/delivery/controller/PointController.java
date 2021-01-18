package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.delivery.domain.PointVo;
import com.kh.delivery.service.PointService;

@RestController
@RequestMapping(value="/point")
public class PointController {

	@Inject
	PointService pointService;
	
	@RequestMapping(value="/getMyPoint", method=RequestMethod.POST)
	public PointVo getMyPoint(int account_no) throws Exception {
		PointVo pointVo = pointService.getMyPoint(account_no);
		return pointVo;
	}
	
	@RequestMapping(value="/getUserPointList", method=RequestMethod.POST)
	public List<PointVo> getUserPointList() throws Exception {
		List<PointVo> pointList = pointService.getUserPointList();
		return pointList;
	}
	
	@RequestMapping(value="/getDlvrPointList", method=RequestMethod.POST)
	public List<PointVo> getDlvrPointList() throws Exception {
		List<PointVo> pointList = pointService.getDlvrPointList();
		return pointList;
	}
}
