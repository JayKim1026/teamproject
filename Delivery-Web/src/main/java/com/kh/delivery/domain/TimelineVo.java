package com.kh.delivery.domain;

public class TimelineVo {
	private int review_no;
	private String review_content;
	private int user_no;
	private String review_img;
	private int review_star;
	private int dlvr_no;
	private String review_state;
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public int getDlvr_no() {
		return dlvr_no;
	}
	public void setDlvr_no(int dlvr_no) {
		this.dlvr_no = dlvr_no;
	}
	public String getReview_state() {
		return review_state;
	}
	public void setReview_state(String review_state) {
		this.review_state = review_state;
	}
	
	@Override
	public String toString() {
		return "TimelineVo [review_no=" + review_no + ", review_content=" + review_content + ", user_no=" + user_no
				+ ", review_img=" + review_img + ", review_star=" + review_star + ", dlvr_no=" + dlvr_no
				+ ", review_state=" + review_state + "]";
	}
	
}
