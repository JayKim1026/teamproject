package com.kh.delivery.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.AdminVo;
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
	
	
	/*신규 멤버수(배달원,일반회원), 신규의 기준은 하루*/
	@RequestMapping(value="/getMemberList", method=RequestMethod.POST)
	@ResponseBody
	public int getMemberList(Model model) throws Exception {
		System.out.println("멤버리스트 작동");
		/*일반회원*/
		int member_Count = adminService.getMemberList();
		System.out.println("member_Count:" + member_Count);
		
		/*대기중인 배달원*/
		int dlvr_Count_waiting = adminService.getWaitingDeliveryList();
		System.out.println("dlvr_Count_waiting:" + dlvr_Count_waiting);
		
		/*가입승인된 배달원*/
		int dlvr_Count = adminService.getDeliveryList();
		System.out.println("dlvr_Count:" + dlvr_Count);
		
		return member_Count;
		
		
	}
	
	@RequestMapping(value="getDeliveryList", method=RequestMethod.POST)
	@ResponseBody
	public void getDeliveryList() throws Exception{
		System.out.println("딜리버리리스트 작동");
	}
	
	@RequestMapping(value="getTimelineList", method=RequestMethod.POST)
	@ResponseBody
	public void getTimelineList() throws Exception{
		System.out.println("타임라인리스트 작동");
	}
	
	@RequestMapping(value="getReportList", method=RequestMethod.POST)
	@ResponseBody
	public void getRepotList() throws Exception{
		System.out.println("리포트리스트 작동");
	}
	
	@RequestMapping(value="/reportPage", method=RequestMethod.GET)
	public String reportPage() throws Exception {
		return "admin/report";
	}
}
