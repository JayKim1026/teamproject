package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.ReportDao;
import com.kh.delivery.domain.ReportVo;

@Service
public class ReportServiceImpl implements ReportService {

	@Inject
	ReportDao reportDao;
	
	@Override
	public String report(ReportVo reportVo) throws Exception {
		String result = reportDao.report(reportVo);
		return result;
	}

	@Override
	public List<ReportVo> getReportList(String report_type) throws Exception {
		List<ReportVo> reportList = reportDao.getReportList(report_type);
		return reportList;
	}

	@Override
	public String approveReport(ReportVo reportVo) throws Exception {
		String result = reportDao.approveReport(reportVo);
		return result;
	}

	@Override
	public String revokeReport(ReportVo reportVo) throws Exception {
		String result = reportDao.revokeReport(reportVo);
		return result;
	}

}
