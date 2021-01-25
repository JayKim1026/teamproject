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
/* 주석처리 완료 */
@Controller
@RequestMapping(value = "/deliver")
public class DeliverController implements Codes {

	@Inject
	private DeliverService deliverService;
	
	@Inject
	private OrderService orderServiece;

	/* 배달원 회원가입 run
	 * f_dlvr_img 프로필 사진
	 * f_dlvr_idcard 신분증 사진
	 * str_dlvr_birth 생일
	 * */
	@RequestMapping(value = "/dlvr_RegisterRun", method = RequestMethod.POST)
	public String dlvr_RegisterRun(DeliverVo deliverVo, MultipartFile f_dlvr_img, MultipartFile f_dlvr_idcard,
		   String str_dlvr_birth, RedirectAttributes rttr) throws Exception {
		
		/* 생일 표기 */
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dlvr_birth = new Date(df.parse(str_dlvr_birth).getTime());
		deliverVo.setDlvr_birth(dlvr_birth);
		
		/* 업로드 파일 이름
		 * org_dlvr_img 배달원 프로필 사진 파일이름
		 * org_dlvr_idcard 배달원 신분증 사진 파일이름
		 * */
		String org_dlvr_img = f_dlvr_img.getOriginalFilename();
		String org_dlvr_idcard = f_dlvr_idcard.getOriginalFilename();
		
		/* 업로드된 파일 이미지 파일인지 확인
		 * isImage_img 프로필 사진 이미지 파일인지 확인
		 * isImage_idcard 신분증 파일 이미지 파일인지 확인
		 * */
		boolean isImage_img = FileUploadUtil.isImage(org_dlvr_img);
		boolean isImage_idcard = FileUploadUtil.isImage(org_dlvr_idcard);

		/* 업로드 파일이 이미지가 아닐경우 */
		if (!isImage_img || !isImage_idcard) {
			rttr.addFlashAttribute("isImage_msg", "notImage");
			return "redirect:/account/dlvr_RegisterForm";
		} else {
			/* aws 업로드 & DB에 저장할 파일명 
			 * dlvr_img 프로필 사진
			 * dlvr_idcard 신분증 사진
			 * DLVR_IMG s3 버킷내 폴더 이름(배달원 프로필 사진)
			 * DLVR_IDCARD s3 버킷내 폴더이름(배달원 신분증 사진)
			 * ex) Dlvr_Img/배달원아이디/업로드 파일명
			 * */
			String dlvr_img = DLVR_IMG + deliverVo.getDlvr_id() + "_" + org_dlvr_img;
			String dlvr_idcard = DLVR_IDCARD + deliverVo.getDlvr_id() + "_" + org_dlvr_idcard;
			deliverVo.setDlvr_img(dlvr_img);
			deliverVo.setDlvr_idcard(dlvr_idcard);
			
			/*
			 * s3에 업로드
			 * */
			File dlvrImg = new File(org_dlvr_img);
			File dlvrIdcard = new File(org_dlvr_idcard);
			f_dlvr_img.transferTo(dlvrImg);
			f_dlvr_idcard.transferTo(dlvrIdcard);
			FileUploadUtil.upload(dlvrImg, dlvr_img);
			FileUploadUtil.upload(dlvrIdcard, dlvr_idcard);

			
			String result = deliverService.registDeliver(deliverVo);
			rttr.addFlashAttribute("dlvrJoin_msg", result);
			return "redirect:/account/loginForm";
		}
	}

	/* 배달원 로그인
	 * dlvr_id 배달원 아이디
	 * dlvr_pw 배달원 비밀번호
	 * */
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String dlvr_id, String dlvr_pw, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		
		/*로그인 성공*/
		if (deliverVo != null) {
			session.setAttribute("deliverVo", deliverVo);
			rttr.addFlashAttribute("login_result", "login_success");
			return "redirect:/";
		/*로그인 실패*/	
		} else {
			rttr.addFlashAttribute("login_result", "login_fail");
			return "redirect:/account/loginForm";
		}
	}

	/* 배달원 마이페이지 
	 * 세션에 담겨있던 로그인정보를 해당 페이지로 다시 돌려줌
	 * */
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String deliverInfo(Model model, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_img = deliverVo.getDlvr_img();
		model.addAttribute("image_url", BUCKET_URL + dlvr_img);
		return "/deliver/info";
	}

	/* 배달원 프로필 사진 변경
	 * 세션에 저장되어있던 로그인정보를 이용
	 * orgImg 기존에 저장되어있던 이미지
	 * chgImg 변경할 이미지
	 * */
	@RequestMapping(value = "/imgChange", method = RequestMethod.POST)
	public String imgChange(String orgImg, MultipartFile chgImg, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();

		String org_chgImg = chgImg.getOriginalFilename(); // 변경할 이미지의 본래 이름
		
		/* isImageResult 업로드된 파일 사진인지 아닌지 확인*/
		boolean isImageResult = FileUploadUtil.isImage(org_chgImg);
		if (!isImageResult) {
			rttr.addFlashAttribute("isImageResult", "notImge");
		} else {
			FileUploadUtil.delete(orgImg); // 아마존에 저장된 기존 이미지 삭제.
			String chg_img = DLVR_IMG + dlvr_id + "_" + org_chgImg;
			deliverVo.setDlvr_img(chg_img);
			File chgDlvrImg = new File(org_chgImg);
			chgImg.transferTo(chgDlvrImg);
			FileUploadUtil.upload(chgDlvrImg, chg_img); // 아마존에 변경할 사진 저장.

			String result = deliverService.imgChange(dlvr_id, chg_img);
			if (result == "imgChange_success") {
				rttr.addFlashAttribute("imgChangeResult", "success");
			} else {
				rttr.addFlashAttribute("imgChangeResult", "fail");
			}
		}
		return "redirect:/deliver/info";

	}

	/* 해당 배달원 계정 비밀번호 변경시 기존에 설정되어있는 비밀번호와 사용자가 입력한 비밀번호가 일치하는지 확인
	 * orgPw 사용자가 입력한 기존 비밀번호
	 * */
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(String orgPw, HttpSession session) throws Exception {

		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();

		String result = deliverService.pwCheck(dlvr_id, orgPw);
		return result;
	}

	/* 비밀번호 변경
	 * chwPw 변경할 비밀번호
	 * dlvr_id 세션에 저장되어있던 로그인정보에서 사용자 아이디 받아옴
	 * */
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public String pwChange(String chgPw, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();

		String result = deliverService.pwChange(dlvr_id, chgPw);
		/* 비밀번호 변경 성공 */
		if (result == "pwChange_success") {
			deliverVo.setDlvr_pw(chgPw);
			rttr.addFlashAttribute("pwChangeResult", "success");
		/* 비밀번호 변경 실패*/
		} else {
			rttr.addFlashAttribute("pwChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	/* 배달원 이메일 변경
	 * chgEmail 변경할 이메일
	 * dlvr_id 세션에 저장되어있던 로그인정보에서 사용자 아이디 받아옴
	 * */
	@RequestMapping(value = "/emailChange", method = RequestMethod.POST)
	public String emailChange(String chgEmail, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		String result = deliverService.emailChange(dlvr_id, chgEmail);
		/* 이메일 변경 성공*/
		if (result == "emailChange_success") {
			rttr.addFlashAttribute("emailChangeResult", "success");
			deliverVo.setDlvr_email(chgEmail);
			session.setAttribute("deliverVo", deliverVo);
		/* 이메일 변경 실패*/
		} else {
			rttr.addFlashAttribute("emailChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	/* 배달원 휴대폰 번호 변경
	 * chgPhone 변경할 폰번호
	 * dlvr_id 세션에 저장되어있던 로그인정보에서 사용자 아이디 받아옴
	 * */
	@RequestMapping(value = "/phoneChange", method = RequestMethod.POST)
	public String phoneChange(String chgPhone, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();
		String result = deliverService.phoneChange(dlvr_id, chgPhone);
		/* 폰번호 변경 성공 */
		if (result == "phoneChange_success") {
			rttr.addFlashAttribute("phoneChangeResult", "success");
			deliverVo.setDlvr_phone(chgPhone);
			session.setAttribute("deliverVo", deliverVo);
			/* 폰번호 변경 실패 */
		} else {
			rttr.addFlashAttribute("phoneChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	/* 배달원 주소지 변경
	 * chgAddr 변경할 폰번호
	 * dlvr_id 세션에 저장되어있던 로그인정보에서 사용자 아이디 받아옴
	 * */
	@RequestMapping(value = "/addrChange", method = RequestMethod.POST)
	public String addrChange(String chgAddr, HttpSession session, RedirectAttributes rttr) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		String dlvr_id = deliverVo.getDlvr_id();

		String result = deliverService.addrChange(chgAddr, dlvr_id);
		
		/* 주소 변경 성공 */
		if (result == "addrChange_success") {
			rttr.addFlashAttribute("addrChangeResult", "success");
			deliverVo.setDlvr_addr(chgAddr);
			session.setAttribute("deliverVo", deliverVo);
		/* 주소 변경 실패 */
		} else {
			rttr.addFlashAttribute("addrChangeResult", "fail");
		}
		return "redirect:/deliver/info";
	}

	/* 배달 내역 페이지 이동
	 * dlvr_no 세션에 저장되어있던 로그인정보에서 배달원 번호 가져옴
	 * 해당 배달원 배달내역 model을 이용해 View로 전송
	 * */
	@RequestMapping(value = "/deliveryList", method = RequestMethod.GET)
	public String deliverOrderList(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo)session.getAttribute("deliverVo");
		int dlvr_no = deliverVo.getDlvr_no();
		List<OrderVo> deliveryList = orderServiece.getDeliveryList(dlvr_no);
		model.addAttribute("deliveryList", deliveryList);
		return "deliver/deliveryList";
	}

	/* 점수 */
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String deliverPoint(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "deliver/point";
	}

	/* deliverPage 1:1 질문 페이지 이동 */
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String deliverQuestion(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "deliver/question";
	}

	/* deliverPage 후기 페이지 이동 */
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String deliverReview(Model model, HttpSession session) throws Exception {
		DeliverVo deliverVo = (DeliverVo) session.getAttribute("deliverVo");
		return "deliver/question";
	}
	
	/* 기능없음 */
	@RequestMapping(value="/getDlvrRank", method=RequestMethod.POST)
	@ResponseBody
	public List<DeliverVo> getDlvrRank() throws Exception {
		List<DeliverVo> dlvrRank = deliverService.getDlvrRank();
		return dlvrRank;
	}
	
	/************************************************************************/
	/*                             안드로이드                                                                   */
	/***********************************************************************/
	
	// 배달원 로그인
	@RequestMapping(value = "/android/login", method = RequestMethod.POST)
	@ResponseBody
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverService.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}

	// 배달원 회원가입
	@RequestMapping(value = "/android/registDeliver", method = RequestMethod.POST)
	@ResponseBody
	public String registDeliver(DeliverVo deliverVo, String str_dlvr_birth) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dlvr_birth = new Date(sdf.parse(str_dlvr_birth).getTime());
		deliverVo.setDlvr_birth(dlvr_birth);
		String result = deliverService.registDeliver(deliverVo);
		return result;
	}

	// 배달원 정보 수정
	@RequestMapping(value = "/android/modifyDeliver", method = RequestMethod.POST)
	@ResponseBody
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		String result = deliverService.modifyDeliver(deliverVo);
		return result;
	}
}
