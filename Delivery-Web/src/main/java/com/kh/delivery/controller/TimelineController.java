package com.kh.delivery.controller;

import java.util.List;

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

import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.TimelineService;

@Controller
@RequestMapping(value="/timeline")
public class TimelineController {
	
	@Inject
	private TimelineService timelineService;
	
	@RequestMapping(value="/showTimeline", method=RequestMethod.GET)
	public String timelineList(Model model) {
		
		List<TimelineVo> list = timelineService.timelineList();
		
		model.addAttribute("timelineVo", list);
		return "pages/timeline";
	}
	
	@RequestMapping(value="/insertArticle", method=RequestMethod.POST)
	@ResponseBody
	public String insertArticle(@RequestBody TimelineVo timelineVo,HttpSession session, MultipartFile review_img) throws Exception {
		System.out.println("TimelineController, insertArticle, timelineVo" +  timelineVo);
		System.out.println("TimelineController, insertArticle, timelineVo" +  review_img);
		timelineService.insertArticle(timelineVo);
		return "success";
	}
	
	@RequestMapping(value="/uploadFile")
	public String uploadFile()throws Exception{
		return null;
	}
	
	@RequestMapping(value="/updateArticle", method=RequestMethod.POST)
	public void updateArticle(@RequestBody TimelineVo timelineVo) throws Exception{
		System.out.println("TimelineController, updateArticle, timelineVo" + timelineVo);
		timelineService.updateArticle(timelineVo);
		
	}
	
	@RequestMapping(value="/deleteArticle/{review_no}", method=RequestMethod.GET)
	public void deleteArticle(@PathVariable("review_no") int review_no) throws Exception {
		System.out.println("TimelineController, deleteArticle, review_no:" + review_no);
		timelineService.deleteArticle(review_no);
	}
	
	
}
