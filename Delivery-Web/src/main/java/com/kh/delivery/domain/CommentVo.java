package com.kh.delivery.domain;

import java.sql.Timestamp;

public class CommentVo {
	
	private int c_no;
	private String c_content;
	private Timestamp c_date;
	private int time_no;
	private String user_id;
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Timestamp getC_date() {
		return c_date;
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
	public int getTime_no() {
		return time_no;
	}
	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "CommentVo [c_no=" + c_no + ", c_content=" + c_content + ", c_date=" + c_date + ", time_no=" + time_no
				+ ", user_id=" + user_id + "]";
	}
	
}
