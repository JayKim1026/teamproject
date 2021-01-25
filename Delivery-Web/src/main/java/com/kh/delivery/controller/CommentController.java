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
/* 주석처리 완료 */
@RestController
@RequestMapping(value = "/comment")
public class CommentController implements Codes {

	@Inject
	private CommentService commentService;
	
	/* 댓글 입력 
	 * commentVo
	 * c_content 댓글 내용
	 * writer_no 작성자 회원번호
	 * */
	@RequestMapping(value="/insertComment", method = RequestMethod.POST)
	public String insertComment(CommentVo commentVo)throws Exception{
		String result = commentService.insertComment(commentVo);
		return result;
	}
	
	/* 댓글 목록
	 * time_no 글번호
	 * 해당 글번호에 대한 댓글 목록만 불러옴.
	 * */
	@RequestMapping(value="/getCommentList/{time_no}", method = RequestMethod.POST)
	public List<CommentVo> getCommentList(@PathVariable("time_no")int time_no, Model model)throws Exception{
		String image_url = BUCKET_URL;
		List<CommentVo> list = commentService.getCommentList(time_no);
		model.addAttribute("image_url", image_url);
		return list;
	}
	
	/* 댓글 수정 
	 * c_content 수정될 내용
	 * c_no 수정할 댓글 번호
	 * */
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	public String updateComment(CommentVo commentVo) throws Exception{
		System.out.println("CommentController, updateComment, commentVo:" + commentVo);
		String result = commentService.updateComment(commentVo);
		return result;
	}
	
	/* 댓글 삭제
	 * c_no 삭제할 댓글 번호
	 * */
	@RequestMapping(value="/deleteComment/{c_no}", method=RequestMethod.POST)
	public String deleteComment(@PathVariable("c_no") int c_no)throws Exception{
		String result = commentService.deleteComment(c_no);
		return result;
	}
	
	/* 댓글 작성 후 현재 출력된 댓글 이후 작성된 댓글 조회 */
	@RequestMapping(value="/getCurrentComment", method=RequestMethod.POST)
	public List<CommentVo> getCurrentComment(CommentVo commentVo) throws Exception {
		System.out.println("CommentController, getCurrentComment, commentVo:" + commentVo);
		List<CommentVo> commentList = commentService.getCurrentComment(commentVo);
		return commentList;
	}
}
