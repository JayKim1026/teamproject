package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.service.ReportService;

@RestController
@RequestMapping(value="/report")
public class ReportController {
// 완료
	@Inject
	ReportService reportService;
	
	// 신고하기
	@RequestMapping(value="/report", method=RequestMethod.POST)
	public String report(ReportVo reportVo) throws Exception {
		String result = reportService.report(reportVo);
		return result;
	}
	
}
