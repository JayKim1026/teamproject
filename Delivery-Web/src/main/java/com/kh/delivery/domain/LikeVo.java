package com.kh.delivery.domain;

public class LikeVo {
	
	private int time_no;
	private String user_id;
	
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
		return "LikeVo [time_no=" + time_no + ", user_id=" + user_id + "]";
	}
	
}
