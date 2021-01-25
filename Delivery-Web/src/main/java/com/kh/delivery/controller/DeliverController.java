package com.kh.delivery.controller;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

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
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.DeliverService;
import com.kh.delivery.service.OrderService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/deliver")
public class DeliverController implements Codes {

	@Inject
	DeliverService deliverService;
	
	@Inject
	OrderService orderServiece;

	// 웹
	// 배달원 회원가입 run
	@RequestMapping(value = "/dlvr_RegisterRun", method = RequestMethod.POST)
	public String dlvr_RegisterRun(DeliverVo deliverVo, MultipartFile f_dlvr_img, MultipartFile f_dlvr_idcard,
		   String str_dlvr_birth, RedirectAttributes rttr) throws Exception {
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dlvr_birth = new Date(df.parse(str_dlvr_birth).getTime());
		deliverVo.setDlvr_birth(dlvr_birth);

		String org_dlvr_img = f_dlvr_img.getOriginalFilename();
		String org_dlvr_idcard = f_dlvr_idcard.getOriginalFilename();

		boolean isImage_img = FileUploadUtil.isImage(org_dlvr_img);
		boolean isImage_idcard = FileUploadUtil.isImage(org_dlvr_idcard);

		if (!isImage_img || !isImage_idcard) {
			rttr.addFlashAttribute("isImage_msg", "notImage");
			return "redirect:/account/dlvr_RegisterForm";
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
			String result = deliverService.registDeliver(deliverVo);
			System.out.println("result = " + result);
			rttr.addFlashAttribute("dlvrJoin_msg", result);
			return "redirect:/account/loginForm";
		}
	}

	// 배달원 로그인
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String dlvr_id, String dlvr_pw, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		System.out.println("dlvr_id, dlvr_pw : " + dlvr_id + " / " + dlvr_pw);
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		System.out.println("deliverVo : " + deliverVo);
		if (deliverVo != null) {
			session.setAttribute("deliverVo", deliverVo);
			rttr.addFlashAttribute("login_result", "login_success");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("login_result", "login_fail");
			return "redirect:/account/loginForm";
		}
	}

	// deliverPage로 이동 + 배달원 기본 정보
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String deliverInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_img = deliverVo.getDlvr_img();
		model.addAttribute("image_url", BUCKET_URL + dlvr_img);
		return "/deliver/info";
	}

	// 배달원 프로필 사진 변경
	@RequestMapping(value = "/imgChange", method = RequestMethod.POST)
	public String imgChange(String orgImg, MultipartFile chgImg, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		System.out.println("chgImg : " + chgImg); // 변경할 이미지
		System.out.println("orgImg : " + orgImg); // 기존의 이미지 (userVo.user_img)

		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("controller 프사변경 dlvr_id : " + dlvr_id);

		String org_chgImg = chgImg.getOriginalFilename(); // 변경할 이미지의 본래 이름
		System.out.println("org_chgImg : " + org_chgImg);

		boolean isImageResult = FileUploadUtil.isImage(org_chgImg);
		if (!isImageResult) {
			rttr.addFlashAttribute("isImageResult", "notImge");
		} else {
			FileUploadUtil.delete(orgImg); // 아마존에 저장된 기존 이미지 삭제.
			String chg_img = DLVR_IMG + dlvr_id + "_" + org_chgImg;
			System.out.println("아마존이랑 DB에 저장할 이름 chg_img : " + chg_img);
			deliverVo.setDlvr_img(chg_img);
			File chgDlvrImg = new File(org_chgImg);
			chgImg.transferTo(chgDlvrImg);
			FileUploadUtil.upload(chgDlvrImg, chg_img); // 아마존에 변경할 사진 저장.

			String result = deliverService.imgChange(dlvr_id, chg_img);
			System.out.println("result : " + result);
			if (result == "imgChange_success") {
				rttr.addFlashAttribute("imgChangeResult", "success");
				System.out.println("이미지 저장 성공");
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail");
				System.out.println("이미지 저장 실패");
			}
		}
		return "redirect:/deliver/info";

	}

	// deliverPage 배달원 비밀번호 변경
	// 현재 비밀번호 확인 ajax
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(String orgPw, HttpSession session) throws Exception {

		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		// System.out.println("컨트롤러 비밀번호 확인 orgPw : " + orgPw);
		// System.out.println("컨트롤러 비밀번호 확인 dlvr_id : " + dlvr_id);

		String result = deliverService.pwCheck(dlvr_id, orgPw);
		// System.out.println("controller 비밀번호 확인 result : " + result);
		return result;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public String pwChange(String chgPw, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("deliver controller 비번 변경 chgPw : " + chgPw);
		System.out.println("deliver controller 비번 변경 dlvr_id : " + dlvr_id);

		String result = deliverService.pwChange(dlvr_id, chgPw);
		System.out.println("deliver 컨트롤러 비번 변경 result : " + result);
		if (result == "pwChange_success") {
			deliverVo.setDlvr_pw(chgPw);
			rttr.addFlashAttribute("pwChangeResult", "success");
		} else {
			rttr.addFlashAttribute("pwChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	// deliverPage 배달원 이메일 변경
	@RequestMapping(value = "/emailChange", method = RequestMethod.POST)
	public String emailChange(String chgEmail, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("chgEmail : " + chgEmail);
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		String result = deliverService.emailChange(dlvr_id, chgEmail);
		if (result == "emailChange_success") {
			rttr.addFlashAttribute("emailChangeResult", "success");
			deliverVo.setDlvr_email(chgEmail);
			session.setAttribute("deliverVo", deliverVo);
		} else {
			rttr.addFlashAttribute("emailChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	// deliverPage 배달원 휴대전화 변경
	@RequestMapping(value = "/phoneChange", method = RequestMethod.POST)
	public String phoneChange(String chgPhone, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("컨트롤러 phone dlvr_id : " + dlvr_id);
		System.out.println("컨트롤러 phone chgPhone : " + chgPhone);
		String result = deliverService.phoneChange(dlvr_id, chgPhone);
		if (result == "phoneChange_success") {
			rttr.addFlashAttribute("phoneChangeResult", "success");
			deliverVo.setDlvr_phone(chgPhone);
			session.setAttribute("deliverVo", deliverVo);
		} else {
			rttr.addFlashAttribute("phoneChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	// deliverPage 배달원 주소 변경
	@RequestMapping(value = "/addrChange", method = RequestMethod.POST)
	public String addrChange(String chgAddr, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("chgAddr : " + chgAddr);
		System.out.println("dlvr_id : " + dlvr_id);

		String result = deliverService.addrChange(chgAddr, dlvr_id);

		if (result == "addrChange_success") {
			rttr.addFlashAttribute("addrChangeResult", "success");
			deliverVo.setDlvr_addr(chgAddr);
			session.setAttribute("deliverVo", deliverVo);
		} else {
			rttr.addFlashAttribute("addrChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	// deliverPage 배달 내역 페이지 이동
	@RequestMapping(value = "/deliveryList", method = RequestMethod.GET)
	public String deliverOrderList(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo)session.getAttribute("deliverVo");
		int dlvr_no = deliverVo.getDlvr_no();
		System.out.println("dlvr_no : " + dlvr_no);
		List<OrderVo> deliveryList = orderServiece.getDeliveryList(dlvr_no);
		System.out.println("controller deliveryList : " + deliveryList);
		model.addAttribute("deliveryList", deliveryList);
		return "deliver/deliveryList";
	}

	// deliverPage 포인트 페이지 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String deliverPoint(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "deliver/point";
	}

	// deliverPage 1:1 질문 페이지 이동
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String deliverQuestion(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "deliver/question";
	}

	// deliverPage 후기 페이지 이동
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String deliverReview(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "deliver/question";
	}
	
	@RequestMapping(value="/getDlvrRank", method=RequestMethod.POST)
	@ResponseBody
	public List<DeliverVo> getDlvrRank() throws Exception {
		List<DeliverVo> dlvrRank = deliverService.getDlvrRank();
		System.out.println("dlvrRank = " + dlvrRank);
		return dlvrRank;
	}

	
	// 안드로이드
	// 배달원 로그인
	@RequestMapping(value = "/android/login", method = RequestMethod.POST)
	@ResponseBody
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		System.out.println("android/login = " + deliverVo);
		return deliverVo;
	}

	// 배달원 회원가입
	@RequestMapping(value = "/android/registDeliver", method = RequestMethod.POST)
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
	@RequestMapping(value = "/android/modifyDeliver", method = RequestMethod.POST)
	@ResponseBody
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		System.out.println("mod, deliverVo = " + deliverVo.toString());
		String result = deliverService.modifyDeliver(deliverVo);
		System.out.println("mod, resutl = " + result);
		return result;
	}
}
