package com.kh.delivery.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QuestionVo {

	private int q_no;
	private int q_order_no;
	private String q_category;
	private String q_phone;
	private String q_email;
	private String q_title;
	private String q_content;
	private String q_writer;
	private String q_img;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Timestamp q_date;

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public int getQ_order_no() {
		return q_order_no;
	}

	public void setQ_order_no(int q_order_no) {
		this.q_order_no = q_order_no;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getQ_phone() {
		return q_phone;
	}

	public void setQ_phone(String q_phone) {
		this.q_phone = q_phone;
	}

	public String getQ_email() {
		return q_email;
	}

	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}

	public String getQ_img() {
		return q_img;
	}

	public void setQ_img(String q_img) {
		this.q_img = q_img;
	}

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

	@Override
	public String toString() {
		return "QuestionVo [q_no=" + q_no + ", q_order_no=" + q_order_no + ", q_category=" + q_category + ", q_phone="
				+ q_phone + ", q_email=" + q_email + ", q_title=" + q_title + ", q_content=" + q_content + ", q_writer="
				+ q_writer + ", q_img=" + q_img + ", q_date=" + q_date + "]";
	}

}
