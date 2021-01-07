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

import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.UserService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/user")
public class UserController implements Codes {

	@Inject
	private UserService userService;

	// 웹
	// 로그인
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("loginRun, user_info = " + user_id + ", " + user_pw);
		UserVo userVo = userService.login(user_id, user_pw);
		System.out.println("loginRun, userVo = " + userVo);
		if (userVo != null) {
			rttr.addFlashAttribute("login_result", "login_success");
			session.setAttribute("userVo", userVo);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("login_result", "login_fail");
			return "redirect:/account/loginForm";
		}
	}

	@RequestMapping(value = "/registerRun", method = RequestMethod.POST)
	public String registRun(UserVo userVo, MultipartFile f_user_img , String str_user_birth, RedirectAttributes rttr) throws Exception {
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date user_birth = new Date(df.parse(str_user_birth).getTime());
		userVo.setUser_birth(user_birth);
		
		String org_user_img = f_user_img.getOriginalFilename();
		boolean isImage_img = FileUploadUtil.isImage(org_user_img);
		
		if(!isImage_img) {
			rttr.addFlashAttribute("isImage_msg", "notImage");
			return "redirect:/account/registerForm";
		} else {
			//user table에 프로필 사진 경로 + 유저아이디 + 파일 이름 저장
			String user_img = USER_IMG + userVo.getUser_id() + "_" + org_user_img;
			userVo.setUser_img(user_img);
			System.out.println("userVo : " + userVo);
			
			//aws에 프로필 사진 파일 저장
			File userImg = new File(org_user_img);
			f_user_img.transferTo(userImg);
			
			FileUploadUtil.upload(userImg, user_img);
			System.out.println("userVo : " + userVo);
			
			String result = userService.registUser(userVo);
			System.out.println("result = " + result);
			rttr.addFlashAttribute("userJoin_msg", result);
			return "redirect:/account/loginForm";
		}
	}

	// userPage로 이동 + user 기본 정보
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String userInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_img = userVo.getUser_img();
		model.addAttribute("image_url", BUCKET_URL + user_img);
		return "user/info";
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
		} else {
			FileUploadUtil.delete(orgImg); // 아마존에 저장된 기존 이미지 삭제.
			String chg_img = USER_IMG + user_id + "_" + org_chgImg;
			System.out.println("아마존이랑 DB에 저장할 이름 user_img : " + chg_img);
			userVo.setUser_img(chg_img);
			File chgUserImg = new File(org_chgImg);
			chgImg.transferTo(chgUserImg);
			FileUploadUtil.upload(chgUserImg, chg_img); // 아마존에 변경할 사진 저장.

			String result = userService.imgChange(user_id, chg_img);
			System.out.println("result : " + result);
			if (result == "imgChange_success") {
				rttr.addFlashAttribute("imgChangeResult", "success");
				System.out.println("이미지 저장 성공");
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail");
				System.out.println("이미지 저장 실패");
			}
		}
		return "redirect:/user/info";
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
	public String pwChange(String chg_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("chg_pw : " + chg_pw);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.pwChange(user_id, chg_pw);
		if (result == "pwChange_success") {
			rttr.addFlashAttribute("pwChangeResult", "success");
			userVo.setUser_pw(chg_pw);
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("pwChangeResult", "fail");
		}
		return "redirect:/user/info";
	}

	// 이메일 변경
	@RequestMapping(value = "/emailChange", method = RequestMethod.POST)
	public String emailChange(String chg_email, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("chg_email : " + chg_email);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.emailChange(user_id, chg_email);
		if (result == "emailChange_success") {
			rttr.addFlashAttribute("emailChangeResult", "success");
			userVo.setUser_email(chg_email);
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("emailChangeResult", "fail");
		}
		return "redirect:/user/info";
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
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("phoneChangeResult", "fail");
		}
		return "redirect:/user/info";
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
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("addrChangeResult", "fail");
		}
		return "redirect:/user/info";
	}

	// userPage 주문 내역 조회 페이지로 이동 + 주문 내역 조회
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String userOrderList(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		int user_no = userVo.getUser_no();
		List<OrderVo> orderList = userService.getOrderList(user_no);
		if(orderList != null) {
			model.addAttribute("orderList", orderList);
		} else {
			model.addAttribute("orderList", "주문 정보가 없습니다.");
		}
		
		return "user/orderList";
	}

	// userPage 포인트 페이지로 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String userPoint(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "user/point";
	}

	// userPage 1:1 질문 페이지로 이동
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String userQuestion(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "user/question";
	}

	// userPage 내가 작성한 후기 페이지로 이동
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String userReview(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		return "user/review";
	}

	// 주소 검색
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address() throws Exception {
		return "util/address";
	}
	
	// 안드로이드
	// 유저 정보 가져오기
	@RequestMapping(value = "/getUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public UserVo getUserInfo(int user_no) throws Exception {
		System.out.println("getUserInfo, user_no = " + user_no);
		UserVo userVo = userService.getUserInfo(user_no);
		System.out.println("getUserInfo, userVo = " + userVo.toString());
		return userVo;
	}

}
