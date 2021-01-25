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
	public String report(int def_no, int plt_no, String reportType, String reportCode, ReportVo reportVo) throws Exception {
		//System.out.println("def_no : " + def_no);
		//System.out.println("plt_no : " + plt_no);
		//System.out.println("reportType : " + reportType);
		//System.out.println("reportCode : " + reportCode);
		reportVo.setDef_no(def_no);
		reportVo.setPlt_no(plt_no);
		reportVo.setReport_type(reportType);
		reportVo.setReport_code(reportCode);
		String result = reportService.report(reportVo);
		return result;
	}
	
}
