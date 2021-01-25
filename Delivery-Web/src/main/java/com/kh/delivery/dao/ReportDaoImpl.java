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
	private SqlSession sqlSession;
	
	// 신고하기
	@Override
	public String report(ReportVo reportVo) throws Exception {
		sqlSession.insert(NAMESPACE + "report", reportVo);
		return "report_success";
	}
	
	/*----- 신고 관련 카운트 -----*/
	/*신규 신고대기*/
	@Override
	public int getNewRequestedReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewRequestedReportCount");
		return count;
	}
	/*신규 일반글 신고*/
	@Override
	public int getNewPostReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewPostReportCount");
		return count;
	}
	/*신규 댓글 신고*/
	@Override
	public int getNewCommentReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewCommentReportCount");
		return count;
	}
	/* 전체 게시물 신고  */
	@Override
	public int getTotalPostReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalPostReportCount");
		return count;
	}
	/* 전체 댓글 신고*/
	@Override
	public int getTotalCommentReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalCommentReportCount");
		return count;
	}
	/* 완료된 신고 */
	@Override
	public int getFinishedReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getFinishedReportCount");
		return count;
	}
	/*----- 신고 관련 카운트 끝 -----*/
	
	/*----- 신고 목록 + 처리 -----*/	
	/*신고대기 목록*/
	@Override
	public List<ReportVo> getReportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "getReportList");
		return list;
	}
	/* 신고접수 목록*/
	@Override
	public List<ReportVo> getAcceptReportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "getAcceptReportList");
		return list;
	}
	/* 신고취소 목록*/
	@Override
	public List<ReportVo> getCancelReportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "getCancelReportList");
		return list;
	}
	/* 신고상태 변경*/
	@Override
	public void updateReportState(int report_no, String report_state) {
		Map<String, Object> map = new HashMap<>();
		map.put("report_no", report_no);
		map.put("report_state", report_state);
		sqlSession.selectList(NAMESPACE + "updateReportState", map);
	}
	/*----- 신고 목록 + 처리 끝-----*/	
}
