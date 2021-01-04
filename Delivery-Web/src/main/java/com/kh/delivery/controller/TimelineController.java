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

import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.TimelineService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/timeline")
public class TimelineController implements Codes {

	@Inject
	private TimelineService timelineService;

	// 웹
	@RequestMapping(value="/showTimeline", method=RequestMethod.GET)
	public String showTimeline2(Model model) throws Exception {
		List<TimelineVo> timelineList = timelineService.timelineList2();
		String image_url = BUCKET_URL;
		System.out.println("showTimeline2, timelineList = " + timelineList);
		model.addAttribute("timelineList", timelineList);
		model.addAttribute("image_url", image_url);
		return "pages/timeline";
	}
	
	@RequestMapping(value="/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public Map insertArticle2(TimelineVo timelineVo, HttpSession session, MultipartFile f_timeline_img,
			Model model) throws Exception {
		Map<String, String> map = new HashMap<>();
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
		
		System.out.println("insertArticle2, timeline_img:" + time_img);
		System.out.println("insertArticle2, time_content:" + time_content);
		
		String result = timelineService.insertArticle2(timelineVo);
		System.out.println("result" + result);
		
		
		
		map.put("time_img", time_img);
		map.put("time_content", time_content);
		map.put("result", result);
		
	
		
		
		return map;
	}

	@RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String updateArticle2(TimelineVo timelineVo) throws Exception {
		System.out.println("TimelineController, updateArticle, timelineVo" + timelineVo);
		String result = timelineService.updateArticle2(timelineVo);
		return result;
	}

	@RequestMapping(value = "/deleteArticle/{review_no}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteArticle2(@PathVariable("review_no") int review_no) throws Exception {
		System.out.println("TimelineController, deleteArticle, review_no:" + review_no);
		String result = timelineService.deleteArticle2(review_no);
		return result;
	}
	
	
	// 안드로이드
	@RequestMapping(value="/getTimelineList", method=RequestMethod.POST)
	@ResponseBody
	public List<TimelineVo> getTimelineList() throws Exception {
		List<TimelineVo> timelineList = timelineService.timelineList();
		return timelineList;
	}
	
	@RequestMapping(value="/aInsertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String insertArticle(TimelineVo timelineVo) throws Exception {
		System.out.println("atimelineVo = " + timelineVo);
		String result = timelineService.insertArticle2(timelineVo);
		return result;
	}
}
