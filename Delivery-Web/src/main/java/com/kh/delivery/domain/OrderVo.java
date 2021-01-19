package com.kh.delivery.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderVo {
	// 기본 테이블
	private int order_no;
	private String order_ca;
	private String order_req;
	private double order_lat;
	private double order_lng;
	private int user_no;
	private int dlvr_no;
	private String order_state;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Timestamp order_date;

	// 조인으로 가져오는 값
	private String user_name;
	public String getCode_no() {
		return code_no;
	}

	public void setCode_no(String code_no) {
		this.code_no = code_no;
	}

	private String code_detail;
	private String code_no;
	private String dlvr_name;
	private int time_star;

	public int getTime_star() {
		return time_star;
	}

	public void setTime_star(int time_star) {
		this.time_star = time_star;
	}

	public String getDlvr_name() {
		return dlvr_name;
	}

	public void setDlvr_name(String dlvr_name) {
		this.dlvr_name = dlvr_name;
	}

	public String getCode_detail() {
		return code_detail;
	}

	public void setCode_detail(String code_detail) {
		this.code_detail = code_detail;
	}

	public OrderVo() {
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getOrder_ca() {
		return order_ca;
	}

	public void setOrder_ca(String order_ca) {
		this.order_ca = order_ca;
	}

	public String getOrder_req() {
		return order_req;
	}

	public void setOrder_req(String order_req) {
		this.order_req = order_req;
	}

	public double getOrder_lat() {
		return order_lat;
	}

	public void setOrder_lat(double order_lat) {
		this.order_lat = order_lat;
	}

	public double getOrder_lng() {
		return order_lng;
	}

	public void setOrder_lng(double order_lng) {
		this.order_lng = order_lng;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getDlvr_no() {
		return dlvr_no;
	}

	public void setDlvr_no(int dlvr_no) {
		this.dlvr_no = dlvr_no;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "OrderVo [order_no=" + order_no + ", order_ca=" + order_ca + ", order_req=" + order_req + ", order_lat="
				+ order_lat + ", order_lng=" + order_lng + ", user_no=" + user_no + ", dlvr_no=" + dlvr_no
				+ ", order_state=" + order_state + ", order_date=" + order_date + ", user_name=" + user_name
				+ ", code_detail=" + code_detail + ", code_no=" + code_no + ", dlvr_name=" + dlvr_name + ", time_star="
				+ time_star + "]";
	}

}
