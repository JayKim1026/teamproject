package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.PointDao;
import com.kh.delivery.dao.ReportDao;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.util.Codes;

@Service
public class ReportServiceImpl implements ReportService, Codes {

	@Inject
	ReportDao reportDao;
	
	@Inject
	PointDao pointDao;
	
	@Inject
	AccountDao accountDao;
	
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
	@Transactional
	public String approveReport(ReportVo reportVo) throws Exception {
		String result = reportDao.approveReport(reportVo);
		PointVo pltPointVo = new PointVo(REPORT, reportVo.getPlt_no(), REPORT_POINT);
		pointDao.insertPoint(pltPointVo);
		accountDao.updatePoint(pltPointVo);
		PointVo defPointVo = new PointVo(REPORTED, reportVo.getDef_no(), REPORTED_POINT);
		pointDao.insertPoint(defPointVo);
		accountDao.updatePoint(defPointVo);
		return result;
	}

	@Override
	public String revokeReport(ReportVo reportVo) throws Exception {
		String result = reportDao.revokeReport(reportVo);
		return result;
	}

}
