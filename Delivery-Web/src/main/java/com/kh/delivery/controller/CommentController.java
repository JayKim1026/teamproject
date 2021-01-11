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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.CommentVo;
import com.kh.delivery.domain.LikeVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.CommentService;
import com.kh.delivery.service.TimelineService;
import com.kh.delivery.util.Codes;
import com.kh.delivery.util.FileUploadUtil;

@RestController
@RequestMapping(value = "/comment")
public class CommentController implements Codes {

	@Inject
	private CommentService commentService;
	
	@RequestMapping(value="/insertComment", method = RequestMethod.POST)
	public String insertComment(@RequestBody CommentVo commentVo)throws Exception{
		System.out.println("CommentController, insertComment, commentVo:" + commentVo);
		commentService.insertComment(commentVo);
		return "success";
	}
	
	@RequestMapping(value="/getCommentList/{time_no}", method = RequestMethod.GET)
	public List<CommentVo> getCommentList(@PathVariable("time_no")int time_no, Model model)throws Exception{
		String image_url = BUCKET_URL;
		String user_img = USER_IMG;
		System.out.println("CommentController, getCommentList, time_no:" + time_no);
		List<CommentVo> list = commentService.getCommentList(time_no);
		System.out.println("CommentController, getCommentList, list:" + list);
		model.addAttribute("image_url", image_url);
		return list;
	}
	
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	public String updateComment(@RequestBody CommentVo commentVo) throws Exception{
		System.out.println("updateComment..");
		System.out.println("CommentController, updateComment, commentVo:" + commentVo);
		commentService.updateComment(commentVo);
		return "success";
	}
	
	@RequestMapping(value="/deleteComment/{c_no}", method=RequestMethod.GET)
	public String deleteComment(@PathVariable("c_no") int c_no)throws Exception{
		System.out.println("CommentController, deleteComment, c_no:" + c_no);
		commentService.deleteComment(c_no);
		return "success";
	}
}
