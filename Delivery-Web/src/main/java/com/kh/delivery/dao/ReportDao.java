package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.ReportVo;

public interface ReportDao {
	
	public String report(ReportVo reportVo) throws Exception;
	
	// 관리자
	/*----- 신고 관련 카운트 -----*/
	/*신규 신고대기*/
	public int getNewRequestedReportCount();
	/*신규 일반글 신고*/
	public int getNewPostReportCount();
	/*신규 댓글 신고*/
	public int getNewCommentReportCount();
	/*전체 게시물 신고 */
	public int getTotalPostReportCount();
	/*전체 댓글 신고*/
	public int getTotalCommentReportCount();
	/*완료된 신고*/
	public int getFinishedReportCount();
	/*----- 신고 관련 카운트 끝-----*/
	
	/*----- 신고 목록 + 처리-----*/
	/*신고대기 목록*/
	public List<ReportVo> getReportList();
	/* 신고접수 목록*/
	public List<ReportVo> getAcceptReportList();
	/* 신고취소 목록*/
	public List<ReportVo> getCancelReportList();
	/* 신고상태 변경*/
	public void updateReportState(int report_no, String report_state);
	/*----- 신고 목록 + 처리 끝-----*/
}
