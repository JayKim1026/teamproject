package com.kh.delivery.controller;

import java.io.File;

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
import com.kh.delivery.service.DeliverService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping("/deliverPage")
public class DeliverPageController implements Codes {

	@Inject
	DeliverService deliverService;

	// deliverPage로 이동 + 배달원 기본 정보
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String deliverInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		if (deliverVo != null) {
			String dlvr_img = deliverVo.getDlvr_img();
			model.addAttribute("image_url", BUCKET_URL + dlvr_img);
			return "pages/deliverPage/info";
		} else {
			rttr.addFlashAttribute("loginPlz", "loginPlz");
			return "redirect:/";
		}
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
			return "redirect:/deliverPage/info";
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
				return "redirect:/deliverPage/info";
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail");
				System.out.println("이미지 저장 실패");
				return "redirect:/deliverPage/info";
			}
		}

	}

	// deliverPage 배달원 비밀번호 변경
	// 현재 비밀번호 확인 ajax
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(String dlvr_pw, HttpSession session) throws Exception {

		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		// System.out.println("컨트롤러 비밀번호 확인 dlvr_pw : " + dlvr_pw);
		// System.out.println("컨트롤러 비밀번호 확인 dlvr_id : " + dlvr_id);

		String result = deliverService.pwCheck(dlvr_id, dlvr_pw);
		// System.out.println("controller 비밀번호 확인 result : " + result);
		return result;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public String pwChange(String chg_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("deliver controller 비번 변경 chg_pw : " + chg_pw);
		System.out.println("deliver controller 비번 변경 dlvr_id : " + dlvr_id);

		String result = deliverService.pwChange(dlvr_id, chg_pw);
		System.out.println("deliver 컨트롤러 비번 변경 result : " + result);
		if (result == "pwChange_success") {
			deliverVo.setDlvr_pw(chg_pw);
			rttr.addFlashAttribute("pwChangeResult", "success");
			return "redirect:/deliverPage/info";
		} else {
			rttr.addFlashAttribute("pwChangeResult", "fail");
			return "redirect:/deliverPage/info";
		}
	}

	// deliverPage 배달원 이메일 변경
	@RequestMapping(value = "/emailChange", method = RequestMethod.POST)
	public String emailChange(String chg_email, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("chg_email : " + chg_email);
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		String result = deliverService.emailChange(dlvr_id, chg_email);
		if (result == "emailChange_success") {
			deliverVo.setDlvr_email(chg_email);
			rttr.addFlashAttribute("emailChangeResult", "success");
			return "redirect:/deliverPage/info";
		} else {
			rttr.addFlashAttribute("emailChangeResult", "fail");
			return "redirect:/deliverPage/info";

		}
	}

	// deliverPage 배달원 휴대전화 변경
	@RequestMapping(value = "/phoneChange", method = RequestMethod.POST)
	public String phoneChange(String chg_phone, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("컨트롤러 phone dlvr_id : " + dlvr_id);
		System.out.println("컨트롤러 phone chg_phone : " + chg_phone);
		String result = deliverService.phoneChange(dlvr_id, chg_phone);
		if (result == "phoneChange_success") {
			rttr.addFlashAttribute("phoneChangeResult", "success");
			deliverVo.setDlvr_phone(chg_phone);
			return "redirect:/deliverPage/info";
		} else {
			rttr.addFlashAttribute("phoneChangeResult", "fail");
			return "redirect:/deliverPage/info";
		}
	}

	// deliverPage 배달원 주소 변경
	// 사용자 주소 변경
	@RequestMapping(value = "/addrChange", method = RequestMethod.POST)
	public String addrChange(String chg_addr, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		System.out.println("chg_addr : " + chg_addr);
		System.out.println("dlvr_id : " + dlvr_id);

		String result = deliverService.addrChange(chg_addr, dlvr_id);

		if (result == "addrChange_success") {
			deliverVo.setDlvr_addr(chg_addr);
			rttr.addFlashAttribute("addrChangeResult", "success");
			return "redirect:/deliverPage/info";
		} else {
			rttr.addFlashAttribute("addrChangeResult", "fail");
			return "redirect:/deliverPage/info";
		}

	}

	// deliverPage 배달 내역 페이지 이동
	@RequestMapping(value = "/deliveryList", method = RequestMethod.GET)
	public String deliverOrderList(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "pages/deliverPage/deliveryList";
	}

	// deliverPage 포인트 페이지 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String deliverPoint(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "pages/deliverPage/point";
	}

	// deliverPage 1:1 질문 페이지 이동
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String deliverQuestion(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "pages/deliverPage/question";
	}

	// deliverPage 후기 페이지 이동
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String deliverReview(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "pages/deliverPage/question";
	}
}
