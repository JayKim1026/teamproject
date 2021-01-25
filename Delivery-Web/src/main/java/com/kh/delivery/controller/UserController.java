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
import com.kh.delivery.service.OrderService;
import com.kh.delivery.service.UserService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/user")
public class UserController implements Codes {
// 완료
	@Inject
	private UserService userService;
	@Inject
	private OrderService orderService;

	// 웹
	// 로그인
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = userService.login(user_id, user_pw);
		if (userVo != null) {
			rttr.addFlashAttribute("login_result", "login_success");
			session.setAttribute("userVo", userVo);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("login_result", "login_fail");
			return "redirect:/account/loginForm";
		}
	}
	// 사용자 회원가입
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
			String result = userService.registUser(userVo);
			//aws에 프로필 사진 파일 저장
			File userImg = new File(org_user_img);
			f_user_img.transferTo(userImg);
			FileUploadUtil.upload(userImg, user_img);
			rttr.addFlashAttribute("userJoin_msg", result);
			return "redirect:/account/loginForm";
		}
	}
	// 사용자 정보 페이지 이동
	@RequestMapping(value = "/info", method=RequestMethod.GET)
	public String userInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_img = userVo.getUser_img();
		model.addAttribute("image_url", BUCKET_URL + user_img);
		return "user/info";
	}
	// 사용자 주문 내역 조회 페이지 이동
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String userOrderList(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		int user_no = userVo.getUser_no();
		List<OrderVo> orderList = orderService.getUserOrderList(user_no);
		if(orderList != null) {
			model.addAttribute("orderList", orderList);
		} else {
			model.addAttribute("orderList", "주문 정보가 없습니다.");
		}
		return "user/orderList";
	}
	// 사용자 포인트 페이지 이동
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String userPoint() throws Exception {
		return "user/point";
	}
	// 사용자 1:1 질문 페이지 이동
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String userQuestion() throws Exception {
		return "user/question";
	}
	// 사용자 작성한 후기 페이지 이동
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String userReview() throws Exception {
		return "user/review";
	}
	// 메시지 페이지 이동
	@RequestMapping(value="/messageForm", method=RequestMethod.GET)
	public String messageForm(HttpSession session, Model model) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		OrderVo orderVo = orderService.getMyOrder(userVo.getUser_no());
		model.addAttribute("orderVo", orderVo);
		model.addAttribute("image_url", BUCKET_URL);
		return "user/message";
	}
	
	// 프로필 사진 변경
	@RequestMapping(value = "/imgChange", method = RequestMethod.POST)
	public String imgChange(String orgImg, MultipartFile chgImg, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();

		String orgChgImg = chgImg.getOriginalFilename(); // 변경할 이미지의 본래 이름
		boolean isImageResult = FileUploadUtil.isImage(orgChgImg);
		if (!isImageResult) {
			rttr.addFlashAttribute("isImageResult", "notImge");
		} else {
			String chg_img = USER_IMG + user_id + "_" + orgChgImg;
			String result = userService.imgChange(user_id, chg_img);
			if (result.equals("imgChange_success")) {
				FileUploadUtil.delete(orgImg); // 아마존에 저장된 기존 이미지 삭제.
				File chgUserImg = new File(orgChgImg);
				chgImg.transferTo(chgUserImg);
				FileUploadUtil.upload(chgUserImg, chg_img); // 아마존에 변경할 사진 저장.
				userVo.setUser_img(chg_img);
				session.setAttribute("userVo", userVo);
				rttr.addFlashAttribute("imgChangeResult", "success");
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail");
			}
		}
		return "redirect:/user/info";
	}
	// 현재 비밀번호 확인
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(String orgPw, HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.pwCheck(user_id, orgPw);
		return result;
	}
	// 사용자 비밀번호 변경
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public String pwChange(String chgPw, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.pwChange(user_id, chgPw);
		if (result.equals("pwChange_success")) {
			rttr.addFlashAttribute("pwChangeResult", "success");
			userVo.setUser_pw(chgPw);
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("pwChangeResult", "fail");
		}
		return "redirect:/user/info";
	}
	// 사용자 이메일 변경
	@RequestMapping(value = "/emailChange", method = RequestMethod.POST)
	public String emailChange(String chgEmail, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.emailChange(user_id, chgEmail);
		if (result.equals("emailChange_success")) {
			rttr.addFlashAttribute("emailChangeResult", "success");
			userVo.setUser_email(chgEmail);
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("emailChangeResult", "fail");
		}
		return "redirect:/user/info";
	}
	// 사용자 휴대전화 변경
	@RequestMapping(value = "/phoneChange", method = RequestMethod.POST)
	public String phoneChange(String chgPhone, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.phoneChange(user_id, chgPhone);
		if (result.equals("phoneChange_success")) {
			rttr.addFlashAttribute("phoneChangeResult", "success");
			userVo.setUser_phone(chgPhone);
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("phoneChangeResult", "fail");
		}
		return "redirect:/user/info";
	}
	// 사용자 주소 변경
	@RequestMapping(value = "/addrChange", method = RequestMethod.POST)
	public String addrChange(String chgAddr, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.addrChange(chgAddr, user_id);
		if (result.equals("addrChange_success")) {
			rttr.addFlashAttribute("addrChangeResult", "success");
			userVo.setUser_addr(chgAddr);
			session.setAttribute("userVo", userVo);
		} else {
			rttr.addFlashAttribute("addrChangeResult", "fail");
		}
		return "redirect:/user/info";
	}
	
	// 주소 검색
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address() throws Exception {
		return "util/address";
	}
	// 사용자 포인트 랭킹 조회
	@RequestMapping(value="/getUserRank", method=RequestMethod.POST)
	@ResponseBody
	public List<UserVo> getUserRank() throws Exception {
		List<UserVo> userRank = userService.getUserRank();
		return userRank;
	}
	
	// 안드로이드
	// 유저 정보 가져오기
	@RequestMapping(value = "/android/getUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public UserVo getUserInfo(int user_no) throws Exception {
		UserVo userVo = userService.getUserInfo(user_no);
		return userVo;
	}

}
