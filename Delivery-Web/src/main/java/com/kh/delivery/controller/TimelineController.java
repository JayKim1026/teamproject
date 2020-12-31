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
@RequestMapping(value = "/timeline")
public class TimelineController implements Codes {

	@Inject
	private TimelineService timelineService;

	@RequestMapping(value = "/showTimeline", method = RequestMethod.GET)
	public String timelineList(Model model) {

		List<TimelineVo> timelineList = timelineService.timelineList();
		String image_url = BUCKET_URL;
		System.out.println(timelineList);
		model.addAttribute("timelineList", timelineList);
		model.addAttribute("image_url", image_url);

		return "pages/timeline";
	}

	@RequestMapping(value = "/insertArticle", method = RequestMethod.POST)
	@ResponseBody
	public String insertArticle(TimelineVo timelineVo, HttpSession session, MultipartFile f_timeline_img,
			Model model) throws Exception {
		System.out.println("TimelineController, insertArticle, timelineVo" + timelineVo);
		UserVo userVo = (UserVo) session.getAttribute("userVo");
		if (f_timeline_img != null) {
			String org_timeline_img = f_timeline_img.getOriginalFilename();
			System.out.println("TimelineController, org_timeline_img = " + org_timeline_img);
			boolean isImage_img = FileUploadUtil.isImage(org_timeline_img);
			if (!isImage_img) {
				return "fail";
			}

			String timeline_img = TIMELINE_IMG + userVo.getUser_id() + "_" + org_timeline_img;
			System.out.println("TimelineController, review_img = " + timeline_img);
			File file = new File(org_timeline_img);
			f_timeline_img.transferTo(file);

			FileUploadUtil.upload(file, timeline_img);
			timelineVo.setTimeline_img(timeline_img);
		}

		timelineService.insertArticle(timelineVo);
		
		String timeline_content = timelineVo.getTimeline_content();
		String timeline_img = timelineVo.getTimeline_img();
		System.out.println("TimelineController, insertArticle, timeline_content:" + timeline_content);
		System.out.println("TimelineController, insertArticle, timeline_img:" + timeline_img);
		model.addAttribute("timeline_content", timeline_content);
		model.addAttribute("timeline_img", timeline_img);
		return "success";

	}

	@RequestMapping(value = "/uploadFile")
	public String uploadFile() throws Exception {
		return null;
	}

	@RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
	public void updateArticle(@RequestBody TimelineVo timelineVo) throws Exception {
		System.out.println("TimelineController, updateArticle, timelineVo" + timelineVo);
		timelineService.updateArticle(timelineVo);

	}

	@RequestMapping(value = "/deleteArticle/{review_no}", method = RequestMethod.GET)
	public void deleteArticle(@PathVariable("review_no") int review_no) throws Exception {
		System.out.println("TimelineController, deleteArticle, review_no:" + review_no);
		timelineService.deleteArticle(review_no);
	}

}
