package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.ReportVo;

@Repository
public class ReportDaoImpl implements ReportDao {

	private static final String NAMESPACE = "com.kh.delivery.report.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public String report(ReportVo reportVo) throws Exception {
		sqlSession.insert(NAMESPACE + "report", reportVo);
		return "report_success";
	}

	@Override
	public List<ReportVo> getReportList(String reportType) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("reportType", reportType);
		List<ReportVo> reportList = sqlSession.selectList(NAMESPACE + "getReportList", map);
		return reportList;
	}

	@Override
	public String approveReport(ReportVo reportVo) throws Exception {
		sqlSession.update(NAMESPACE + "approveReport", reportVo);
		return "approveReport_success";
	}

	@Override
	public String revokeReport(ReportVo reportVo) throws Exception {
		sqlSession.update(NAMESPACE + "revokeReport", reportVo);
		return "revokeReport_success";
	}

}
