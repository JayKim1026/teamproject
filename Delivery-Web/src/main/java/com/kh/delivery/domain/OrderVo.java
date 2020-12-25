package com.kh.delivery.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderVo {
	private int order_no;
	private String order_ca;
	private String order_req;
	private double order_lat;
	private double order_lng;
	private int user_no;
	private int dlvr_no;
	private String order_state;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp order_date;

	public OrderVo() {
	}

	public OrderVo(int order_no, String order_ca, String order_req, double order_lat, double order_lng, int user_no,
			int dlvr_no, String order_state, Timestamp order_date) {
		this.order_no = order_no;
		this.order_ca = order_ca;
		this.order_req = order_req;
		this.order_lat = order_lat;
		this.order_lng = order_lng;
		this.user_no = user_no;
		this.dlvr_no = dlvr_no;
		this.order_state = order_state;
		this.order_date = order_date;
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

	@Override
	public String toString() {
		return "OrderVo [order_no=" + order_no + ", order_ca=" + order_ca + ", order_req=" + order_req + ", order_lat="
				+ order_lat + ", order_lng=" + order_lng + ", user_no=" + user_no + ", dlvr_no=" + dlvr_no
				+ ", order_state=" + order_state + ", order_date=" + order_date + "]";
	}

}
