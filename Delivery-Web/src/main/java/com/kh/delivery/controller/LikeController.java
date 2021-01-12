package com.kh.delivery.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.CommentService;
import com.kh.delivery.service.LikeService;
import com.kh.delivery.service.TimelineService;
import com.kh.delivery.util.Codes;

@RestController
@RequestMapping(value = "/like")
public class LikeController implements Codes {

	@Inject
	private LikeService likeService;
	
	@RequestMapping(value="/insertLike/{time_no}/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public String insertLike(@PathVariable("time_no")int time_no,
								@PathVariable("user_id")String user_id) throws Exception{
		System.out.println("insertLike...");
		System.out.println("LikeController, insertLike, time_no:" + time_no);
		System.out.println("LikeController, insertLike, user_id:" + user_id);
		likeService.insertLike(time_no, user_id);
		return "success";
	}
	
	@RequestMapping(value="deleteLike/{time_no}/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public String deleteLike(@PathVariable("time_no")int time_no,
								@PathVariable("user_id")String user_id) throws Exception{
		System.out.println("deleteLike...");
		System.out.println("LikeController, deleteLike, time_no:" + time_no);
		System.out.println("LikeController, deleteLike, user_id:" + user_id);
		likeService.deleteLike(time_no, user_id);
		return "success";
	}
	
}
