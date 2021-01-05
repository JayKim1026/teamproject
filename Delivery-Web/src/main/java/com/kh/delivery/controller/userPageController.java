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

import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.UserService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping("/userPage")
public class userPageController implements Codes {

	@Inject
	UserService userService;

	// userPage로 이동 + user 기본 정보
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String userInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		if (userVo != null) {
			String user_img = userVo.getUser_img();
			model.addAttribute("image_url", BUCKET_URL + user_img);
			return "pages/userPage/info";

		} else {
			rttr.addFlashAttribute("loginPlz", "loginPlz");
			return "redirect:/";
		}
	}

	// 프로필 사진 변경
	@RequestMapping(value = "/imgChange", method = RequestMethod.POST)
	public String imgChange(String orgImg, MultipartFile chgImg, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		System.out.println("chgImg : " + chgImg); // 변경할 이미지
		System.out.println("orgImg : " + orgImg); // 기존의 이미지 (userVo.user_img)

		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		System.out.println("user_id : " + user_id);

		String org_chgImg = chgImg.getOriginalFilename(); // 변경할 이미지의 본래 이름
		System.out.println("org_chgImg : " + org_chgImg);

		boolean isImageResult = FileUploadUtil.isImage(org_chgImg);
		if (!isImageResult) {
			rttr.addFlashAttribute("isImageResult", "notImge");
			return "redirect:/userPage/info";
		} else {

			FileUploadUtil.delete(orgImg); // 아마존에 저장된 기존 이미지 삭제.
			String user_img = USER_IMG + user_id + "_" + org_chgImg;
			System.out.println("아마존이랑 DB에 저장할 이름 user_img : " + user_img);
			userVo.setUser_img(user_img);
			File chgUserImg = new File(org_chgImg);
			chgImg.transferTo(chgUserImg);
			FileUploadUtil.upload(chgUserImg, user_img); // 아마존에 변경할 사진 저장.

			String result = userService.imgChange(user_id, user_img);
			System.out.println("result : " + result);
			if (result == "imgChange_success") {
				rttr.addFlashAttribute("imgChangeResult", "success");
				System.out.println("이미지 저장 성공");
				return "redirect:/userPage/info";
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail");
				System.out.println("이미지 저장 실패");
				return "redirect:/userPage/info";
			}
		}

	}

	// 현재 비밀번호 확인 ajax
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(String user_pw, HttpSession session) throws Exception {

		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		// System.out.println("컨트롤러 user_pw : " + user_pw);
		// System.out.println("컨트롤러 user_id : " + user_id);

		String result = userService.pwCheck(user_id, user_pw);
		// System.out.println("controller result : " + result);
		return result;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public String pwChange(String user_Npw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("user_Npw : " + user_Npw);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.pwChange(user_id, user_Npw);
		if (result == "pwChange_success") {
			userVo.setUser_pw(user_Npw);
			rttr.addFlashAttribute("pwChangeResult", "success");
			return "redirect:/userPage/info";
		} else {
			rttr.addFlashAttribute("pwChangeResult", "fail");
			return "redirect:/userPage/info";
		}
	}

	// 이메일 변경
	@RequestMapping(value = "/emailChange", method = RequestMethod.POST)
	public String emailChange(String user_email, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("user_email : " + user_email);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.emailChange(user_id, user_email);
		if (result == "emailChange_success") {
			userVo.setUser_email(user_email);
			rttr.addFlashAttribute("emailChangeResult", "success");
			return "redirect:/userPage/info";
		} else {
			rttr.addFlashAttribute("emailChangeResult", "fail");
			return "redirect:/userPage/info";
		}
	}

	// 사용자 휴대전화 변경
	@RequestMapping(value = "/phoneChange", method = RequestMethod.POST)
	public String phoneChange(String chg_phone, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		System.out.println("컨트롤러 phone user_id : " + user_id);
		System.out.println("컨트롤러 phone user_phone : " + chg_phone);
		String result = userService.phoneChange(user_id, chg_phone);
		if (result == "phoneChange_success") {
			rttr.addFlashAttribute("phoneChangeResult", "success");
			userVo.setUser_phone(chg_phone);
			return "redirect:/userPage/info";
		} else {
			rttr.addFlashAttribute("phoneChangeResult", "fail");
			return "redirect:/userPage/info";
		}
	}

	// 사용자 주소 변경
	@RequestMapping(value = "/addrChange", method = RequestMethod.POST)
	public String addrChange(String chg_addr, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		System.out.println("chg_addr : " + chg_addr);
		System.out.println("user_id : " + user_id);

		String result = userService.addrChange(chg_addr, user_id);

		if (result == "addrChange_success") {
			userVo.setUser_addr(chg_addr);
			rttr.addFlashAttribute("addrChangeResult", "success");
			return "redirect:/userPage/info";
		} else {
			rttr.addFlashAttribute("addrChangeResult", "fail");
			return "redirect:/userPage/info";
		}

	}

	// userPage 주문 내역 조회 페이지로 이동
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String userOrderList(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "pages/userPage/orderList";
	}

	// userPage 포인트 페이지로 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String userPoint(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "pages/userPage/point";
	}

	// userPage 1:1 질문 페이지로 이동
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String userQuestion(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "pages/userPage/question";
	}

	// userPage 내가 작성한 후기 페이지로 이동
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String userReview(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "pages/userPage/review";
	}
}
