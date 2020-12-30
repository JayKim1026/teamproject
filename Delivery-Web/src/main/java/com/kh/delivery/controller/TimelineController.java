package com.kh.delivery.controller;

import java.io.File;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.TimelineService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@Controller
@RequestMapping(value="/timeline")
public class TimelineController implements Codes{
	
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
	public String insertArticle(TimelineVo timelineVo, HttpSession session, MultipartFile f_review_img, RedirectAttributes rttr) throws Exception {
		System.out.println("TimelineController, insertArticle, timelineVo" +  timelineVo);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		String org_review_img = f_review_img.getOriginalFilename();
		boolean isImage_img = FileUploadUtil.isImage(org_review_img);
		if(!isImage_img) {
			rttr.addFlashAttribute("msg", "notImage");
			return"redirect:/timeline/showTimeline";
		}
		System.out.println("TimelineController, org_review_img = " + org_review_img );
		File file = new File(org_review_img);
		f_review_img.transferTo(file);
		String review_img = TIMELINE_IMG + userVo.getUser_id() + "_" + org_review_img;
		System.out.println("TimelineController, review_img = " + review_img );
		timelineVo.setReview_img(review_img);
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
