package com.kh.delivery.controller;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.UserService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;
import com.kh.delivery.util.Keys;

@Controller
@RequestMapping(value = "/user")
public class UserController implements Codes {

	@Inject
	private UserService userService;
	@Inject
	private JavaMailSender mainSender;

	// 웹
	// userPage 회원정보
	@RequestMapping(value = "/userPage/info", method=RequestMethod.GET)
	public String userInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if(userVo != null) {
			String user_img = userVo.getUser_img();
			model.addAttribute("image_url", BUCKET_URL + user_img);
			return "pages/userPage/info";
			
		} else {
			rttr.addFlashAttribute("loginPlz", "loginPlz");
			return "redirect:/";
			
		}
		
	}

	// userPage 주문 내역 조회
	@RequestMapping(value = "/userPage/orderList", method = RequestMethod.GET)
	public String userOrderList(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		return "pages/userPage/orderList";
	}

	// userPage 포인트
	@RequestMapping(value = "/userPage/point", method = RequestMethod.GET)
	public String userPoint(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		return "pages/userPage/point";
	}
	// userPage 1:1 질문
	@RequestMapping(value = "/userPage/question", method = RequestMethod.GET)
	public String userQuestion(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		return "pages/userPage/question";
	}
	// userPage 내가 작성한 후기
	@RequestMapping(value = "/userPage/review", method = RequestMethod.GET)
	public String userReview(Model model, HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		return "pages/userPage/review";
	}

	// 로그인 화면
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "pages/loginForm";
	}

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
			return "redirect:/user/loginForm";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/checkIdDupl", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkIdDupl(String user_id) throws Exception {
		//System.out.println("checkDulp, user_id = " + user_id);
		boolean result = userService.checkIdDupl(user_id);
		return result;
	}

	// 회원 가입
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registForm() throws Exception {
		return "pages/registerForm";
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
			return "redirect:/user/registerForm";
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
			return "redirect:/";
		}
		
		
	}

	// 주소 검색
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address() throws Exception {
		return "util/address";
	}

	// 아이디, 비밀번호 찾기
	@RequestMapping(value = "/findAccountForm", method = RequestMethod.GET)
	public String findAccountForm() throws Exception {
		return "pages/findAccountForm";
	}

	@RequestMapping(value = "/findAccountRun", method = RequestMethod.POST)
	public String findAccountRun(String user_name, String user_phone, String user_email, RedirectAttributes rttr)
			throws Exception {
		System.out.println("findAccount, user_info = " + user_name + ", " + user_phone + ", " + user_email);
		UserVo userVo = userService.findAccount(user_name, user_phone, user_email);
		System.out.println(userVo);
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom("eogml0807@gmail.com");
				helper.setTo(userVo.getUser_email());
				helper.setSubject("계정 정보");
				helper.setText("아이디 = " + userVo.getUser_id() + ", 비밀번호 = " + userVo.getUser_pw());
			}
		};

		mainSender.send(preparator);
		rttr.addFlashAttribute("msg", "send email");
		return "redirect:/";
	}

	// 프로필 사진 변경
	@RequestMapping(value="/imgChange", method=RequestMethod.POST)
	public String imgChange(String orgImg, MultipartFile chgImg, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("chgImg : " + chgImg); // 변경할 이미지
		System.out.println("orgImg : " + orgImg); // 기존의 이미지 (userVo.user_img)
		
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		System.out.println("user_id : " + user_id);

		String org_chgImg = chgImg.getOriginalFilename(); // 변경할 이미지의 본래 이름
		System.out.println("org_chgImg : " + org_chgImg);
		
		boolean isImageResult = FileUploadUtil.isImage(org_chgImg);
		if(!isImageResult) {
			rttr.addFlashAttribute("isImageResult", "notImge");
			return "redirect:/user/userPage/info";
		} else {
			
			FileUploadUtil.delete(orgImg); // 아마존에 저장된 기존 이미지 삭제.
			String user_img = USER_IMG + user_id + "_" + org_chgImg;
			System.out.println("아마존이랑 DB에 저장할 이름 user_img : " +  user_img);
			userVo.setUser_img(user_img);
			File chgUserImg = new File(org_chgImg);
			chgImg.transferTo(chgUserImg);
			FileUploadUtil.upload(chgUserImg, user_img); // 아마존에 변경할 사진 저장.
			
			String result = userService.imgChange(user_id, user_img);
			System.out.println("result : " + result );
			if(result == "imgChange_success") {
				rttr.addFlashAttribute("imgChangeResult", "success"); //TODO
				System.out.println("이미지 저장 성공");
				return "redirect:/user/userPage/info";
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail"); //TODO
				System.out.println("이미지 저장 실패");
				return "redirect:/user/userPage/info";
			}
		}
		
	}
	
	// 현재 비밀번호 확인 ajax
	@RequestMapping(value="/pwCheck", method=RequestMethod.POST)
	@ResponseBody
	public String pwCheck(String user_pw, HttpSession session) throws Exception {
		
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		//System.out.println("컨트롤러 user_pw : " + user_pw);
		//System.out.println("컨트롤러 user_id : " + user_id);

		String result = userService.pwCheck(user_id, user_pw);
		//System.out.println("controller result : " + result);
		return result;
	}
	
	// 비밀번호 변경
	@RequestMapping(value="/pwChange", method=RequestMethod.POST)
	public String pwChange(String user_Npw, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("user_Npw : " + user_Npw);
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_id = userVo.getUser_id();
		String result = userService.pwChange(user_id, user_Npw);
		if(result == "pwChange_success") {
			userVo.setUser_pw(user_Npw);
			rttr.addFlashAttribute("pwChagneResult", "success");
			return "redirect:userPage/info";
		} else {
			rttr.addFlashAttribute("pwChagneResult", "false");
			return "redirect:userPage/info";
		}
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
