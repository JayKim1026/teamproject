package com.kh.delivery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	@RequestMapping(value="/main")
	public String main() throws Exception{
		return "admin/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm()throws Exception {
		return "admin/loginForm";
	}
	
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
		int member_Count = adminService.getNewMemberCount();
		System.out.println("member_Count:" + member_Count);
		
		/*신규 대기중인 배달원*/
		int dlvr_Count_waiting = adminService.getWaitingDeliveryCount();
		System.out.println("dlvr_Count_waiting:" + dlvr_Count_waiting);
		
		/* 신규 가입승인된 배달원*/
		int dlvr_Count = adminService.getNewDeliveryCount();
		System.out.println("dlvr_Count:" + dlvr_Count);
		
		/* 전체 일반회원 */
		int total_Member_Count = adminService.getTotalMemberCount();
		System.out.println("total_Member_Count:" + total_Member_Count);
		/* 전체 배달원*/
		int total_Deliver_Count = adminService.getTotalDeliveryCount();
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
		int requested_Order_Count = adminService.getRequestedOrderCount();
		System.out.println("requested_Order_Count:" + requested_Order_Count);
		
		/* 진행중 주문 */
		int inProgress_Order_Count = adminService.getOrderInProgressCount();
		System.out.println("inProgress_Order_Count:" + inProgress_Order_Count);
		
		/* 신규 완료된 주문*/
		int finished_Order_Count = adminService.getFinishedOrderCount();
		System.out.println("finished_Order_Count:" + finished_Order_Count);
		
		/*주문 취소(사용자 취소)*/
		int canceled_Order_Count = adminService.getTotalCanceledOrderCount();
		System.out.println("canceled_Order_Count:" + canceled_Order_Count);
		
		/*배달 취소(배달원 취소)*/
		int canceled_Deliver_Count = adminService.getTotalCanceledDeliverCount();
		System.out.println("canceled_Deliver_Count:" + canceled_Deliver_Count);
	
		/*완료된 주문*/
		int total_Finished_Count = adminService.getTotalFinishedOrderCount();
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
		int post_Count = adminService.getNewPostCount();
		System.out.println("post_Count:" + post_Count);
		
		/*신규 리뷰*/
		int review_Count = adminService.getNewReviewCount();
		System.out.println("review_Count:" + review_Count);
		
		/*신규 공지*/
		int notice_Count = adminService.getNewNoticeCount();
		System.out.println("notice_Count:" + notice_Count);
		
		/*전체 일반글*/
		int total_Post_Count = adminService.getTotalPostCount();
		System.out.println("total_Post_Count:" + total_Post_Count);
		
		/*전체 리뷰*/
		int total_Review_Count = adminService.getTotalReviewCount();
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
		int requested_Report_Count = adminService.getNewRequestedReportCount();
		
		/*신규 일반글 신고*/
		int report_Post_Count = adminService.getNewPostReportCount(); 
		
		/*신규 댓글 신고*/
		int report_Comment_Count = adminService.getNewCommentReportCount();
		
		/*전체 게시물 신고 */
		int total_Report_Post_Count = adminService.getTotalPostReportCount();
		
		/*전체 댓글 신고*/
		int total_Report_Comment_Count = adminService.getTotalCommentReportCount();
		
		/*완료된 신고*/
		int finished_Report_Count = adminService.getFinishedReportCount();
		
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
	
	/*일반 회원 리스트*/
	@RequestMapping(value="/getMemberList", method=RequestMethod.POST)
	@ResponseBody
	public List<UserVo> getMemberList() throws Exception{
		System.out.println("클릭클릭...");
		List<UserVo> list = adminService.getMemberList();
		System.out.println("getMemberList, list:" + list);
		return list;
	}
	
	@RequestMapping(value="/getDeliverList", method = RequestMethod.POST)
	public String getDeliverList() throws Exception{
		return null;
	}
	
	@RequestMapping(value="/reportPage", method=RequestMethod.GET)
	public String reportPage() throws Exception {
		return "admin/report";
	}
}
