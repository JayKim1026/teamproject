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
	
	@RequestMapping(value="/insertLike/{time_no}/{account_no}", method=RequestMethod.POST)
	public String insertLike(@PathVariable("time_no")int time_no,
								@PathVariable("account_no")int account_no) throws Exception {
		System.out.println("insertLike...");
		System.out.println("LikeController, insertLike, time_no:" + time_no);
		System.out.println("LikeController, insertLike, account_no:" + account_no);
		String result = likeService.insertLike(time_no, account_no);
		return result;
	}
	
	@RequestMapping(value="deleteLike/{time_no}/{account_no}", method=RequestMethod.POST)
	public String deleteLike(@PathVariable("time_no")int time_no,
								@PathVariable("account_no")int account_no) throws Exception{
		System.out.println("deleteLike...");
		System.out.println("LikeController, deleteLike, time_no:" + time_no);
		System.out.println("LikeController, deleteLike, account_no:" + account_no);
		String result = likeService.deleteLike(time_no, account_no);
		return result;
	}
	
	@RequestMapping(value="/isLike", method=RequestMethod.POST)
	public Boolean isLike(int time_no, int account_no) throws Exception {
		Boolean result = likeService.isLike(time_no, account_no);
		System.out.println("isLike = " + result);
		return result;
	}
	
}
