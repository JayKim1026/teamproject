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

	/*----- 신고 관련 카운트  -----*/
	/*신규 신고대기*/
	@Override
	public int getNewRequestedReportCount() {
		int count = reportDao.getNewRequestedReportCount();
		return count;
	}
	
	/*신규 일반글 신고*/
	@Override
	public int getNewPostReportCount() {
		int count = reportDao.getNewPostReportCount();
		return count;
	}
	
	/*신규 댓글 신고*/
	@Override
	public int getNewCommentReportCount() {
		int count = reportDao.getNewCommentReportCount();
		return count;
	}
	
	/* 전체 게시물 신고  */
	@Override
	public int getTotalPostReportCount() {
		int count = reportDao.getTotalPostReportCount();
		return count;
	}
	
	/* 전체 댓글 신고*/
	@Override
	public int getTotalCommentReportCount() {
		int count = reportDao.getTotalCommentReportCount();
		return count;
	}
	
	/* 완료된 신고 */
	@Override
	public int getFinishedReportCount() {
		int count = reportDao.getFinishedReportCount();
		return count;
	}
	/*----- 신고 관련 카운트 끝 -----*/
	
	/*신고 목록*/
	@Override
	public List<ReportVo> getReportList() {
		List<ReportVo> list = reportDao.getReportList();
		return list;
	}
	
	/* 신고접수 목록*/
	@Override
	public List<ReportVo> getAcceptReportList() {
		List<ReportVo> list = reportDao.getAcceptReportList();
		return list;
	}
	
	/* 신고취소 목록*/
	@Override
	public List<ReportVo> getCancelReportList() {
		List<ReportVo> list = reportDao.getCancelReportList();
		return list;
	}
	
	/* 신고상태 변경*/
	@Override
	public void updateReportState(int report_no, String report_state) {
		reportDao.updateReportState(report_no, report_state);
	}
}
