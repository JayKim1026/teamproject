package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.ReportVo;

public interface ReportDao {
	
	public String report(ReportVo reportVo) throws Exception;
	public List<ReportVo> getReportList(String report_type) throws Exception;
	public String approveReport(ReportVo reportVo) throws Exception;
	public String revokeReport(ReportVo reportVo) throws Exception;
	
}
