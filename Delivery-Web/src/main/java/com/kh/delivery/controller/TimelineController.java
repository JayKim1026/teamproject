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
	
	@Inject
	private LikeService likeService;
	
	// 웹
	@RequestMapping(value="/showTimeline", method=RequestMethod.GET)
	public String showTimeline2(String searchType, Model model) throws Exception {
		List<TimelineVo> timelineList = timelineService.timelineList(searchType);
		String image_url = BUCKET_URL;
		String user_img = USER_IMG;
		
		System.out.println("showTimeline2, timelineList:" + timelineList);
		model.addAttribute("timelineList", timelineList);
		model.addAttribute("image_url", image_url);
		model.addAttribute("user_img", user_img);
		return "timeline/timeline";
	}
	
	@RequestMapping(value="/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertArticle2(TimelineVo timelineVo, HttpSession session, MultipartFile f_timeline_img,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		System.out.println("insertArticle2, timelineVo = " + timelineVo);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		if (f_timeline_img != null) {
			String org_timeline_img = f_timeline_img.getOriginalFilename();
			System.out.println("insertArticle2, org_timeline_img = " + org_timeline_img);
			if (!FileUploadUtil.isImage(org_timeline_img)) {
				map.put("fail", "fail");
				return map;
			}
			String timeline_img = TIMELINE_IMG + userVo.getUser_id() + "_" + org_timeline_img;
			timelineVo.setTime_img(timeline_img);
			System.out.println("insertArticle2, review_img = " + timeline_img);
			
			File file = new File(org_timeline_img);
			f_timeline_img.transferTo(file);
			FileUploadUtil.upload(file, timeline_img);
		}
		
		String time_img = timelineVo.getTime_img();
		String time_content = timelineVo.getTime_content();
		String time_state = timelineVo.getTime_state();
		int time_star = timelineVo.getTime_star();
		System.out.println("insertArticle2, timeline_img:" + time_img);
		System.out.println("insertArticle2, time_content:" + time_content);
		
		String result = timelineService.insertArticle(timelineVo);
		System.out.println("result" + result);
		
		map.put("time_img", time_img);
		map.put("time_content", time_content);
		map.put("result", result);
		map.put("time_state", time_state);
		map.put("time_star", time_star);
		return map;
	}

	@RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String updateArticle(TimelineVo timelineVo) throws Exception {
		System.out.println("TimelineController, updateArticle, timelineVo" + timelineVo);
		String result = timelineService.updateArticle(timelineVo);
		return result;
	}

	@RequestMapping(value = "/deleteArticle/{review_no}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteArticle(@PathVariable("review_no") int review_no) throws Exception {
		System.out.println("TimelineController, deleteArticle, review_no:" + review_no);
		String result = timelineService.deleteArticle(review_no);
		return result;
	}
	
	
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
	
	
	// 안드로이드
	@RequestMapping(value="/android/getTimelineList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getTimelineList(String searchType) throws Exception {
		List<TimelineVo> timelineList = timelineService.timelineList(searchType);
		return timelineList;
	}
	
	@RequestMapping(value="/android/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String aInsertArticle(TimelineVo timelineVo) throws Exception {
		System.out.println("atimelineVo = " + timelineVo);
		String result = timelineService.insertArticle(timelineVo);
		return result;
	}
	
	@RequestMapping(value="/android/getLastTimeline")
	@ResponseBody
	public TimelineVo getLastTimeline() throws Exception {
		TimelineVo timelineVo = timelineService.getLastTimeline();
		return timelineVo;
	}
	
	@RequestMapping(value="/android/getTimelineInfo", method=RequestMethod.POST)
	@ResponseBody
	public TimelineVo getTimelineInfo(int time_no) throws Exception {
		TimelineVo timelineVo = timelineService.selectByNo(time_no);
		return timelineVo;
	}
}
