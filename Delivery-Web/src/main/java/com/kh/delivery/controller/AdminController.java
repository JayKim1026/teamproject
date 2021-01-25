package com.kh.delivery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.AdminService;
import com.kh.delivery.service.DeliverService;
import com.kh.delivery.service.OrderService;
import com.kh.delivery.service.ReportService;
import com.kh.delivery.service.TimelineService;
import com.kh.delivery.service.UserService;
import com.kh.delivery.util.Codes;
/* 주석처리 완료 */
@Controller
@RequestMapping(value="/admin")
public class AdminController implements Codes {
	
	@Inject
	private AdminService adminService;
	@Inject
	private UserService userSerivce;
	@Inject
	private DeliverService deliverService;
	@Inject
	private OrderService orderService;
	@Inject
	private TimelineService timelineService;
	@Inject
	private ReportService reportService;
	
	/* 관리자페이지 메인화면  */
	@RequestMapping(value="/main")
	public String main() throws Exception{
		return "admin/main";
	}
	
	/* 로그인 페이지  */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm()throws Exception {
		return "admin/loginForm";
	}
	
	/* 로그인
	 * admin_id 관리자 아이디
	 * admin_pw 관리자 패스워드
	 * */
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun(String admin_id, String admin_pw, HttpSession session)throws Exception{
		System.out.println("AdminController, loginRun, admin_id:" + admin_id);
		System.out.println("AdminController, loginRun, admin_pw:" + admin_pw);
		AdminVo adminVo = adminService.login(admin_id, admin_pw);
		if(adminVo != null) {
			session.setAttribute("adminVo", adminVo);
			return "redirect:/admin/main";
		}else {
			return "redirect:/admin/login";
		}
		
	}
	
	
	/*신규 멤버수(배달원,일반회원), 신규의 기준은 하루, 전체 멤버수(배달원,일반회원)*/
	@RequestMapping(value="/getMemberCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMemberCount(Model model) throws Exception {
		/* 신규 일반회원*/
		int member_Count = userSerivce.getNewMemberCount();
		System.out.println("member_Count:" + member_Count);
		/*신규 대기중인 배달원*/
		int dlvr_Count_waiting = deliverService.getWaitingDeliveryCount();
		System.out.println("dlvr_Count_waiting:" + dlvr_Count_waiting);
		/* 신규 가입승인된 배달원*/
		int dlvr_Count = deliverService.getNewDeliveryCount();
		System.out.println("dlvr_Count:" + dlvr_Count);
		/* 전체 일반회원 */
		int total_Member_Count = userSerivce.getTotalMemberCount();
		System.out.println("total_Member_Count:" + total_Member_Count);
		/* 전체 배달원*/
		int total_Deliver_Count = deliverService.getTotalDeliveryCount();
		System.out.println("total_Deliver_Count:" + total_Deliver_Count);
		/* 전체회원(일반회원 + 배달원)*/
		int total_All_Member_Count = total_Member_Count + total_Deliver_Count;
		System.out.println("total_All_Member_Count:" + total_All_Member_Count);
		
		Map<String, Object> map = new HashMap<>();
		map.put("member_Count", member_Count);
		map.put("dlvr_Count_waiting", dlvr_Count_waiting);
		map.put("dlvr_Count", dlvr_Count);
		map.put("total_Member_Count", total_Member_Count);
		map.put("total_Deliver_Count", total_Deliver_Count);
		map.put("total_All_Member_Count", total_All_Member_Count);
		return map;
		
	}
	
	/*신규 주문(주문요청, 진행중, 완료), 신규의 기준은 하루, 전체 완료된 주문, 취소된된 주문(회원,배달원)*/
	@RequestMapping(value="getDeliveryCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getDeliveryCount() throws Exception{
		/* 신규의 기준은 하루*/
		/* 신규 주문 요청*/
		int requested_Order_Count = orderService.getRequestedOrderCount();
		System.out.println("requested_Order_Count:" + requested_Order_Count);
		
		/* 진행중 주문 */
		int inProgress_Order_Count = orderService.getOrderInProgressCount();
		System.out.println("inProgress_Order_Count:" + inProgress_Order_Count);
		
		/* 신규 완료된 주문*/
		int finished_Order_Count = orderService.getFinishedOrderCount();
		System.out.println("finished_Order_Count:" + finished_Order_Count);
		
		/*주문 취소(사용자 취소)*/
		int canceled_Order_Count = orderService.getTotalCanceledOrderCount();
		System.out.println("canceled_Order_Count:" + canceled_Order_Count);
		
		/*배달 취소(배달원 취소)*/
		int canceled_Deliver_Count = orderService.getTotalCanceledDeliverCount();
		System.out.println("canceled_Deliver_Count:" + canceled_Deliver_Count);
	
		/*완료된 주문*/
		int total_Finished_Count = orderService.getTotalFinishedOrderCount();
		System.out.println("total_Finished_Count:" + total_Finished_Count);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("requested_Order_Count", requested_Order_Count);
		map.put("inProgress_Order_Count", inProgress_Order_Count);
		map.put("finished_Order_Count", finished_Order_Count);
		map.put("total_Finished_Count", total_Finished_Count);
		map.put("canceled_Order_Count", canceled_Order_Count);
		map.put("canceled_Deliver_Count", canceled_Deliver_Count);
		
		return map;
	}
	
	/*신규 게시글(일반, 리뷰, 공지), 신규의 기준은 하루, 전체 리뷰, 전체 게시글, 전체 리뷰+게시글*/
	@RequestMapping(value="getTimelineCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTimelineCount() throws Exception{
		/*신규 일반글*/
		int post_Count = timelineService.getNewPostCount();
		System.out.println("post_Count:" + post_Count);
		
		/*신규 리뷰*/
		int review_Count = timelineService.getNewReviewCount();
		System.out.println("review_Count:" + review_Count);
		
		/*신규 공지*/
		int notice_Count = timelineService.getNewNoticeCount();
		System.out.println("notice_Count:" + notice_Count);
		
		/*전체 일반글*/
		int total_Post_Count = timelineService.getTotalPostCount();
		System.out.println("total_Post_Count:" + total_Post_Count);
		
		/*전체 리뷰*/
		int total_Review_Count = timelineService.getTotalReviewCount();
		System.out.println("total_Review_Count:" + total_Review_Count);
		
		/* 전체 글(일반글+리뷰)*/
		int total_count = total_Post_Count + total_Review_Count;
		System.out.println("post_Count:" + post_Count);
		Map<String, Object> map = new HashMap<>();
		map.put("post_Count", post_Count);
		map.put("review_Count", review_Count);
		map.put("notice_Count", notice_Count);
		map.put("total_Post_Count", total_Post_Count);
		map.put("total_Review_Count", total_Review_Count);
		map.put("total_count", total_count);
		
		return map;
	}
	
	/*신규 신고(신고대기, 일반글, 댓글), 신규의 기준은 하루, 전체 게시물, 전체 댓글, 완료된*/
	@RequestMapping(value="getReportCount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getRepotCount() throws Exception{
		/*신규 신고대기*/
		int requested_Report_Count = reportService.getNewRequestedReportCount();
		
		/*신규 일반글 신고*/
		int report_Post_Count = reportService.getNewPostReportCount(); 
		
		/*신규 댓글 신고*/
		int report_Comment_Count = reportService.getNewCommentReportCount();
		
		/*전체 게시물 신고 */
		int total_Report_Post_Count = reportService.getTotalPostReportCount();
		
		/*전체 댓글 신고*/
		int total_Report_Comment_Count = reportService.getTotalCommentReportCount();
		
		/*완료된 신고*/
		int finished_Report_Count = reportService.getFinishedReportCount();
		
		Map<String, Object> map = new HashMap<>();
		map.put("requested_Report_Count", requested_Report_Count);
		map.put("report_Post_Count", report_Post_Count);
		map.put("report_Comment_Count", report_Comment_Count);
		map.put("total_Report_Post_Count", total_Report_Post_Count);
		map.put("total_Report_Comment_Count", total_Report_Comment_Count);
		map.put("finished_Report_Count", finished_Report_Count);
		return map;
	}
	
	/* 회원관리 폼 전송*/
	@RequestMapping(value="/editMember")
	public String editMember() throws Exception{
		return "admin/editMember";
	}
	
	/* 일반 회원 리스트 */
	@RequestMapping(value="/getMemberList", method=RequestMethod.POST)
	@ResponseBody
	public List<UserVo> getMemberList() throws Exception{
		List<UserVo> list = userSerivce.getMemberList();
		System.out.println("getMemberList, list:" + list);
		return list;
	}
	
	/* 배달원 리스트 */
	@RequestMapping(value="/getDeliverList", method = RequestMethod.POST)
	@ResponseBody
	public List<DeliverVo> getDeliverList() throws Exception{
		List<DeliverVo> list = deliverService.getDeliverList();
		System.out.println("getDeliverList, list:" + list);
		return list;
	}
	/* 가입 대기중 배달원 */
	@RequestMapping(value="/getWaitingDeliverList", method = RequestMethod.POST)
	@ResponseBody
	public List<DeliverVo> getWaitingDeliverList() throws Exception{
		List<DeliverVo> list = deliverService.getWaitingDeliverList();
		System.out.println("getWaitingDeliverList, list:" + list);
		return list;
	}
	
	/* 일반계정상태 수정 
	 * user_no 유저번호
	 * user_state 계정상태
	 * */
	@RequestMapping(value="/userStateUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String userStateUpdate(int user_no, String user_state)throws Exception {
		System.out.println("userStateUpdate ,user_no:" + user_no);
		System.out.println("userStateUpdate ,user_state:" + user_state);
		String updateResult = userSerivce.userStateUpdate(user_no, user_state);
		System.out.println("userStateUpdate ,updateResult:" + updateResult);
		return updateResult;
	}
	
	/* 배달원 계정상태 수정 
	 * dlvr_no 배달원 번호
	 * dlvr_state 배달원 계정 상태
	 * */
	@RequestMapping(value="/deliverStateUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String deliverStateUpdate(int dlvr_no, String dlvr_state)throws Exception {
		System.out.println("deliverStateUpdate ,dlvr_no:" + dlvr_no);
		System.out.println("deliverStateUpdate ,dlvr_state:" + dlvr_state);
		String updateResult = deliverService.deliverStateUpdate(dlvr_no, dlvr_state);
		System.out.println("memberInfoForm ,updateResult:" + updateResult);
		return updateResult;
	}
	
	/* 주문 목록 폼*/
	@RequestMapping(value="/orderList")
	public String orderList()throws Exception {
		
		return "admin/adminOrderList";
	}
	
	/* 대기중인 주문 목록 */
	@RequestMapping(value="/getWaitingOrderList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getWaitingOrderList()throws Exception {
		List<OrderVo> list = orderService.getWaitingOrderList();
		System.out.println("주문대기목록, list:" + list);
		return list;
	}
	
	/* 접수된 주문 목록 */
	@RequestMapping(value="/getAcceptOrderList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getAcceptOrderList() throws Exception{
		List<OrderVo> list = orderService.getAcceptOrderList();
		System.out.println("주문접수목록, list:" + list);
		return list;
	}
	
	/* 완료된 주문목록 */
	@RequestMapping(value="/getFinishOrderList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getFinishOrderList() throws Exception{
		List<OrderVo> list = orderService.getFinishOrderList();
		System.out.println("주문완료목록, list:" + list);
		return list;
	}
	
	/* 주문자 취소 목록 */
	@RequestMapping(value="/getCancelOrderList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getCancelOrderList() throws Exception{
		List<OrderVo> list = orderService.getCancelOrderList();
		System.out.println("주문자 취소 목록, list:" + list);
		return list;
	}
	
	/* 배달원 취소 목록 */
	@RequestMapping(value="getCancelOrderListByDeliver", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getCancelOrderListByDeliver() throws Exception{
		List<OrderVo> list = orderService.getCancelOrderListByDeliver();
		System.out.println("배달원 취소 목록, list:" + list);
		return list;
	}
	
	/* 배달현황 수정 */
	@RequestMapping(value="updateOrderState", method = RequestMethod.POST)
	@ResponseBody
	public String updateOrderState(int order_no, String order_state) throws Exception{
		System.out.println("updateOrderState, order_no:" + order_no);
		System.out.println("updateOrderState, order_state:" + order_state);
		orderService.updateOrderState(order_no, order_state);
		return "success";
	}
	
	/* 게시판 수정 폼 */
	@RequestMapping(value="/editTimeline")
	public String editTimeline() {
		return "admin/adminEditTimeline";
	}
	
	/* 일반글 목록 */
	@RequestMapping(value="/getPostList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getPostList() throws Exception{
		List<TimelineVo> list = timelineService.getPostList();
		System.out.println("getPostList, list:" + list);
		return list;
	}
	
	/* 리뷰 목록 */
	@RequestMapping(value="/getReviewList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getReviewList() throws Exception{
		List<TimelineVo> list = timelineService.getReviewList();
		System.out.println("getReviewList, list:" + list);
		return list;
	}
	
	/* 공지 목록 */
	@RequestMapping(value="/getNoticeList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getNoticeList() throws Exception{
		List<TimelineVo> list = timelineService.getNoticeList();
		System.out.println("getNotice, list:" + list);
		return list;
	}
	
	/* 게시글 삭제 
	 * time_no 글 번호
	 * */
	@RequestMapping(value="/deleteArticle", method=RequestMethod.POST)
	@ResponseBody
	public String deleteArticle(int time_no) throws Exception{
		System.out.println("deleteArticle, time_no:" + time_no);
		timelineService.deleteArticle(time_no);
		return "success";
	}
	
	/* 신고 페이지 */
	@RequestMapping(value="/report")
	public String report() throws Exception {
		return "admin/newReport";
	}
	
	/* 신고대기 목록*/
	@RequestMapping(value="/getReportList", method=RequestMethod.POST)
	@ResponseBody
	public List<ReportVo> reportList() throws Exception{
			List<ReportVo> list = reportService.getReportList();
			System.out.println("getReportList, list:" + list);
		return list;
	}
	
	/* 신고접수 목록*/
	@RequestMapping(value="/getAcceptReportList", method=RequestMethod.POST)
	@ResponseBody
	public List<ReportVo> getAcceptReportList() throws Exception{
			List<ReportVo> list = reportService.getAcceptReportList();
			System.out.println("getAcceptReportList, list:" + list);
		return list;
	}
	
	/* 신고취소 목록*/
	@RequestMapping(value="/getCancelReportList", method=RequestMethod.POST)
	@ResponseBody
	public List<ReportVo> getCancelReportList() throws Exception{
			List<ReportVo> list = reportService.getCancelReportList();
			System.out.println("getCancelReportList, list:" + list);
		return list;
	}
	
	/* 신고상태 변경
	 * report_no 신고 번호
	 * report_state 신고 상태
	 * */
	@RequestMapping(value="/updateReportState", method=RequestMethod.POST)
	@ResponseBody
	public String updateReportState(int report_no, String report_state) throws Exception{
		reportService.updateReportState(report_no, report_state);
		return "success";
	}
}
