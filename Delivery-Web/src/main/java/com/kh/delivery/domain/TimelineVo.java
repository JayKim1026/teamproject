package com.kh.delivery.domain;

import java.sql.Timestamp;

public class TimelineVo {
	private int timeline_no;
	private int writer_no;
	private String timeline_content;
	private String timeline_img;
	private Timestamp timeline_date;
	private String timeline_state;
	private String writer_name;

	// 리뷰에서만 사용함
	private double review_star;
	private int dlvr_no;
	private String dlvr_name;

	public int getTimeline_no() {
		return timeline_no;
	}

	public void setTimeline_no(int timeline_no) {
		this.timeline_no = timeline_no;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	public String getTimeline_content() {
		return timeline_content;
	}

	public void setTimeline_content(String timeline_content) {
		this.timeline_content = timeline_content;
	}

	public String getTimeline_img() {
		return timeline_img;
	}

	public void setTimeline_img(String timeline_img) {
		this.timeline_img = timeline_img;
	}

	public Timestamp getTimeline_date() {
		return timeline_date;
	}

	public void setTimeline_date(Timestamp timeline_date) {
		this.timeline_date = timeline_date;
	}

	public String getTimeline_state() {
		return timeline_state;
	}

	public void setTimeline_state(String timeline_state) {
		this.timeline_state = timeline_state;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public double getReview_star() {
		return review_star;
	}

	public void setReview_star(double review_star) {
		this.review_star = review_star;
	}

	public int getDlvr_no() {
		return dlvr_no;
	}

	public void setDlvr_no(int dlvr_no) {
		this.dlvr_no = dlvr_no;
	}

	public String getDlvr_name() {
		return dlvr_name;
	}

	public void setDlvr_name(String dlvr_name) {
		this.dlvr_name = dlvr_name;
	}

	@Override
	public String toString() {
		return "TimelineVo [timeline_no=" + timeline_no + ", writer_no=" + writer_no + ", timeline_content="
				+ timeline_content + ", timeline_img=" + timeline_img + ", timeline_date=" + timeline_date
				+ ", timeline_state=" + timeline_state + ", writer_name=" + writer_name + ", review_star=" + review_star
				+ ", dlvr_no=" + dlvr_no + ", dlvr_name=" + dlvr_name + "]";
	}

}
