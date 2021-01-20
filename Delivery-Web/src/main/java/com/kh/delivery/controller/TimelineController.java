package com.kh.delivery.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.LikeService;
import com.kh.delivery.service.TimelineService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/timeline")
public class TimelineController implements Codes {

	@Inject
	private TimelineService timelineService;
	
	// 웹
	// 타임라인 페이지 이동
	@RequestMapping(value="/showTimeline", method=RequestMethod.GET)
	public String showTimeline(String searchType, Model model) throws Exception {
		String image_url = BUCKET_URL;
		model.addAttribute("image_url", image_url);
		return "timeline/timeline";
	}
	
	// 게시물 작성
	@RequestMapping(value="/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String insertArticle(TimelineVo timelineVo, HttpSession session, MultipartFile f_timeline_img,
			Model model) throws Exception {
		System.out.println("insertArticle, timelineVo = " + timelineVo);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		if (f_timeline_img != null) {
			String org_timeline_img = f_timeline_img.getOriginalFilename();
			System.out.println("insertArticle, org_time_img = " + org_timeline_img);
			if (!FileUploadUtil.isImage(org_timeline_img)) {
				return "not_image";
			}
			String time_img = TIMELINE_IMG + userVo.getUser_id() + "_" + org_timeline_img;
			timelineVo.setTime_img(time_img);
			System.out.println("insertArticle, time_img = " + time_img);
			
			File file = new File(org_timeline_img);
			f_timeline_img.transferTo(file);
			FileUploadUtil.upload(file, time_img);
		}
		String result = timelineService.insertArticle(timelineVo);
		System.out.println("result" + result);
		return result;
	}

	// 게시물 수정
	@RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String updateArticle(TimelineVo timelineVo) throws Exception {
		System.out.println("updateArticle, timelineVo" + timelineVo);
		String result = timelineService.updateArticle(timelineVo);
		return result;
	}

	// 게시물 삭제
	@RequestMapping(value = "/deleteArticle/{time_no}", method = RequestMethod.POST)
	@ResponseBody
	public String deleteArticle(@PathVariable("time_no") int time_no) throws Exception {
		System.out.println("deleteArticle, time_no:" + time_no);
		String result = timelineService.deleteArticle(time_no);
		return result;
	}
	
	// 게시물 조회 - 안씀
	/*
	@RequestMapping(value="/content", method = RequestMethod.POST)
	public String content(int time_no, HttpSession session, Model model) throws Exception {
		int account_no;
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		DeliverVo deliverVo;
		if(userVo != null) {
			account_no = userVo.getUser_no();
		} else {
			deliverVo = (DeliverVo) session.getAttribute("deliverVo");
			account_no = deliverVo.getDlvr_no();
		}
		System.out.println("content...");
		String image_url = BUCKET_URL;
		System.out.println("TimelineController, content, time_no:" + time_no);
		TimelineVo timelineVo = timelineService.selectByNo(time_no);
		boolean isLike = likeService.isLike(time_no, account_no);
		System.out.println("TimelineController, content, timelineVo:" + timelineVo);
		model.addAttribute("timelineVo", timelineVo);
		model.addAttribute("image_url", image_url);
		model.addAttribute("isLike", isLike);
		return "timeline/content";	
	}
	*/
	
	// 글 목록 조회
	@RequestMapping(value="/getTimelineList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getTimelineList(int account_no, String searchType) throws Exception {
		System.out.println("getTimelineList, account_no:" + account_no + ", searchType:" + searchType);
		List<TimelineVo> timelineList = timelineService.timelineList(account_no, searchType);
		System.out.println("getTimelineList, timelineList:" + timelineList);
		return timelineList;
	}
	
	// 현재 타임라인 이후에 작성된 글 목록 조회
	@RequestMapping(value="/getCurrentTimeline", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getCurrentTimeline(int account_no, int time_no) throws Exception {
		List<TimelineVo> timelineList = timelineService.getCurrentTimeline(account_no, time_no);
		System.out.println("getCurrentTimeline, timelineList:" + timelineList);
		return timelineList;
	}

	
	// 안드로이드
	// 게시물 작성
	@RequestMapping(value="/android/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String aInsertArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineService.insertArticle(timelineVo);
		System.out.println("aInsertArticle, result:" + result);
		return result;
	}

	// 게시물 수정
	@RequestMapping(value = "/android/updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String aUpdateArticle(TimelineVo timelineVo) throws Exception {
		System.out.println("updateArticle, timelineVo" + timelineVo);
		String result = timelineService.updateArticle(timelineVo);
		return result;
	}

	// 게시물 삭제
	@RequestMapping(value = "/android/deleteArticle", method = RequestMethod.POST)
	@ResponseBody
	public String aDeleteArticle(int time_no) throws Exception {
		System.out.println("deleteArticle, time_no:" + time_no);
		String result = timelineService.deleteArticle(time_no);
		return result;
	}
	
	// 최근 타임라인 1개 조회
	@RequestMapping(value="/android/getLastTimeline")
	@ResponseBody
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = timelineService.getLastTimeline();
		System.out.println("getLastTimeline, timelineVo:" + timelineVo);
		return timelineVo;
	}
	
	// 선택한 타임라인 조회
	@RequestMapping(value="/android/getTimelineInfo", method=RequestMethod.POST)
	@ResponseBody
	public TimelineVo getTimelineInfo(int account_no, int time_no) throws Exception {
		TimelineVo timelineVo = timelineService.selectByNo(account_no, time_no);
		System.out.println("getTimelineInfo, timelineVo:" + timelineVo);
		return timelineVo;
	}
	
}
