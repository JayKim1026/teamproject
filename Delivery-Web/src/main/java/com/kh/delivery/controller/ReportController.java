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

	@Inject
	ReportService reportService;
	
	// 유저
	// 신고하기 - 배달, 타임라인, 댓글 등등 타입 지정해줘야 함
	@RequestMapping(value="/report", method=RequestMethod.POST)
	public String report(ReportVo reportVo) throws Exception {
		String result = reportService.report(reportVo);
		return result;
	}

	
	// 관리자
	// 신고 타입으로 검색 가능
	@RequestMapping(value="/geReportList", method=RequestMethod.POST)
	public List<ReportVo> getReportList(String reportType) throws Exception {
		List<ReportVo> reportList = reportService.getReportList(reportType);
		return reportList;
	}
	
	// reportno, adminno 로 신고 승인
	@RequestMapping(value="/approveReport", method=RequestMethod.POST)
	public String approveReport(ReportVo reportVo) throws Exception {
		String result = reportService.approveReport(reportVo);
		return result;
	}
	
	// reportno, adminno 로 신고 취하
	@RequestMapping(value="/revokeReport", method=RequestMethod.POST)
	public String revokeReport(ReportVo reportVo) throws Exception {
		String result = reportService.revokeReport(reportVo);
		return result;
	}
	
}
