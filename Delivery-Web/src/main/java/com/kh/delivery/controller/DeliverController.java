package com.kh.delivery.controller;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.DeliverService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value="/deliver")
public class DeliverController implements Codes {

	@Inject
	DeliverService deliverService;
	
	// 웹
	
	// 배달원 회원가입
	@RequestMapping(value="/dlvr_RegisterForm", method=RequestMethod.GET)
	public String dlvr_RegisterForm() throws Exception {
		return "pages/dlvr_RegisterForm";
	}
	

	@RequestMapping(value="/dlvr_RegisterRun", method=RequestMethod.POST)
	public String dlvr_RegisterRun(DeliverVo deliverVo, MultipartFile f_dlvr_img , MultipartFile f_dlvr_idcard, String str_dlvr_birth, RedirectAttributes rttr) throws Exception {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dlvr_birth = new Date(df.parse(str_dlvr_birth).getTime());
		deliverVo.setDlvr_birth(dlvr_birth);
		
		String org_dlvr_img = f_dlvr_img.getOriginalFilename();
		String org_dlvr_idcard = f_dlvr_idcard.getOriginalFilename();
		
		boolean isImage_img = FileUploadUtil.isImage(org_dlvr_img);
		boolean isImage_idcard = FileUploadUtil.isImage(org_dlvr_idcard);
		
		if(!isImage_img || !isImage_idcard) {
			rttr.addFlashAttribute("isImage_msg", "notImage");
			return "redirect:/deliver/dlvr_RegisterForm";
		} else {
			// aws 업로드 & DB에 저장할 파일명
			String dlvr_img = DLVR_IMG + deliverVo.getDlvr_id() + "_" + org_dlvr_img; 
			String dlvr_idcard = DLVR_IDCARD + deliverVo.getDlvr_id() + "_" + org_dlvr_idcard;
			
			deliverVo.setDlvr_img(dlvr_img);
			deliverVo.setDlvr_idcard(dlvr_idcard);
			
			File dlvrImg = new File(org_dlvr_img);
			File dlvrIdcard = new File(org_dlvr_idcard);
			f_dlvr_img.transferTo(dlvrImg);
			f_dlvr_idcard.transferTo(dlvrIdcard);
			
			FileUploadUtil.upload(dlvrImg, dlvr_img);
			FileUploadUtil.upload(dlvrIdcard, dlvr_idcard);
			
			System.out.println("deliverVo : " + deliverVo);
			String result = deliverService.registDeliver(deliverVo) ;
			System.out.println("result = " + result);
			rttr.addFlashAttribute("dlvrJoin_msg", result);
			return "redirect:/";
		}
	}

	// 아이디 중복확인
	@RequestMapping(value="/dlvr_checkIdDupl", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkIdDupl(String dlvr_id)throws Exception {
		boolean result = deliverService.checkIdDupl(dlvr_id);
		return result;
	}
	
	// 배달원 로그인
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun(String dlvr_id, String dlvr_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("dlvr_id, dlvr_pw : " + dlvr_id +" / "+ dlvr_pw);
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		System.out.println("deliverVo : " + deliverVo );
		if(deliverVo != null) {
			session.setAttribute("deliverVo", deliverVo);
			rttr.addFlashAttribute("login_result", "login_success");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("login_result", "login_fail");
			return "redirect:/user/loginForm";
		}
	}
	
	
	// deliverPage 회원정보
	@RequestMapping(value = "/deliverPage/info", method=RequestMethod.GET)
	public String deliverInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo)session.getAttribute("deliverVo");
		if(deliverVo != null) {
			String dlvr_img = deliverVo.getDlvr_img();
			model.addAttribute("image_url", BUCKET_URL + dlvr_img);
			return "pages/deliverPage/info";
			
		} else {
			rttr.addFlashAttribute("loginPlz", "loginPlz");
			return "redirect:/";
			
		}
		
	}

	// deliverPage 주문 내역 조회
	@RequestMapping(value = "/deliverPage/orderList", method = RequestMethod.GET)
	public String deliverOrderList(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo)session.getAttribute("deliverVo");
		return "pages/deliverPage/orderList";
	}

	// deliverPage 포인트
	@RequestMapping(value = "/deliverPage/point", method = RequestMethod.GET)
	public String deliverPoint(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo)session.getAttribute("deliverVo");
		return "pages/deliverPage/point";
	}
	// deliverPage 1:1 질문
	@RequestMapping(value = "/deliverPage/question", method = RequestMethod.GET)
	public String deliverQuestion(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo)session.getAttribute("deliverVo");
		return "pages/deliverPage/question";
	}
	
	
	
	// 안드로이드
	// 배달원 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}
	
	// 배달원 회원가입
	@RequestMapping(value="/registDeliver", method=RequestMethod.POST)
	@ResponseBody
	public String registDeliver(DeliverVo deliverVo, String str_dlvr_birth) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dlvr_birth = new Date(sdf.parse(str_dlvr_birth).getTime());
		deliverVo.setDlvr_birth(dlvr_birth);
		System.out.println(deliverVo);
		String result = deliverService.registDeliver(deliverVo);
		return result;
	}
	
	// 배달원 정보 수정
	@RequestMapping(value="/modifyDeliver", method=RequestMethod.POST)
	@ResponseBody
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		System.out.println("mod, deliverVo = " + deliverVo.toString());
		String result = deliverService.modifyDeliver(deliverVo);
		System.out.println("mod, resutl = " + result);
		return result;
	}
}
