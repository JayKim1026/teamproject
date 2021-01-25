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
	
	// 공용
	// 타임라인 목록 조회
	@RequestMapping(value="/getTimelineList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getTimelineList(int account_no, String searchType) throws Exception {
		List<TimelineVo> timelineList = timelineService.timelineList(account_no, searchType);
		return timelineList;
	}
	
	// 웹
	// 타임라인 페이지 이동
	@RequestMapping(value="/showTimeline", method=RequestMethod.GET)
	public String showTimeline(Model model) throws Exception {
		model.addAttribute("image_url", BUCKET_URL);
		return "timeline/timeline";
	}
	// 타임라인 작성
	@RequestMapping(value="/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String insertArticle(TimelineVo timelineVo, HttpSession session, MultipartFile f_timeline_img,
			Model model) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String org_timeline_img = "";
		String time_img = "";
		File file = null;
		if (f_timeline_img != null) {
			org_timeline_img = f_timeline_img.getOriginalFilename();
			if (!FileUploadUtil.isImage(org_timeline_img)) {
				return "not_image";
			}
			time_img = TIMELINE_IMG + userVo.getUser_id() + "_" + org_timeline_img;
			timelineVo.setTime_img(time_img);
		}
		String result = timelineService.insertArticle(timelineVo);
		if(result.equals("insertArticle_success") && !time_img.equals("")) {
			file = new File(org_timeline_img);
			f_timeline_img.transferTo(file);
			FileUploadUtil.upload(file, time_img);
		}
		return result;
	}
	// 타임라인 수정
	@RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String updateArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineService.updateArticle(timelineVo);
		return result;
	}
	// 타임라인 삭제
	@RequestMapping(value = "/deleteArticle/{time_no}", method = RequestMethod.POST)
	@ResponseBody
	public String deleteArticle(@PathVariable("time_no") int time_no) throws Exception {
		String result = timelineService.deleteArticle(time_no);
		return result;
	}
	// 현재 타임라인 이후에 작성된 타임라인 목록 조회
	@RequestMapping(value="/getCurrentTimeline", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getCurrentTimeline(int account_no, int time_no) throws Exception {
		List<TimelineVo> timelineList = timelineService.getCurrentTimeline(account_no, time_no);
		return timelineList;
	}
	
	// 안드로이드
	// 타임라인 작성
	@RequestMapping(value="/android/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String aInsertArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineService.insertArticle(timelineVo);
		return result;
	}
	// 타임라인 수정
	@RequestMapping(value = "/android/updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String aUpdateArticle(TimelineVo timelineVo) throws Exception {
		String result = timelineService.updateArticle(timelineVo);
		return result;
	}
	// 타임라인 삭제
	@RequestMapping(value = "/android/deleteArticle", method = RequestMethod.POST)
	@ResponseBody
	public String aDeleteArticle(int time_no) throws Exception {
		String result = timelineService.deleteArticle(time_no);
		return result;
	}
	// 최근 타임라인 1개 조회
	@RequestMapping(value="/android/getLastTimeline")
	@ResponseBody
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = timelineService.getLastTimeline();
		return timelineVo;
	}
	// 선택한 타임라인 조회
	@RequestMapping(value="/android/getTimelineInfo", method=RequestMethod.POST)
	@ResponseBody
	public TimelineVo getTimelineInfo(int account_no, int time_no) throws Exception {
		TimelineVo timelineVo = timelineService.selectByNo(account_no, time_no);
		return timelineVo;
	}
	
}
