package com.kh.delivery.domain;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DeliverVo {
	private int dlvr_no;
	private String dlvr_id;
	private String dlvr_pw;
	private String dlvr_name;
	private String dlvr_phone;
	private String dlvr_email;
	private String dlvr_addr;
	private String dlvr_img;
	private String dlvr_idcard;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date dlvr_birth;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp dlvr_date;
	private String dlvr_state;
	private int dlvr_point;
	private String dlvr_rank;

	public DeliverVo() {
	}

	public DeliverVo(int dlvr_no, String dlvr_id, String dlvr_pw, String dlvr_name, String dlvr_phone,
			String dlvr_email, String dlvr_addr, String dlvr_img, String dlvr_idcard, Timestamp dlvr_date,
			String dlvr_state, int dlvr_point, String dlvr_rank) {
		this.dlvr_no = dlvr_no;
		this.dlvr_id = dlvr_id;
		this.dlvr_pw = dlvr_pw;
		this.dlvr_name = dlvr_name;
		this.dlvr_phone = dlvr_phone;
		this.dlvr_email = dlvr_email;
		this.dlvr_addr = dlvr_addr;
		this.dlvr_img = dlvr_img;
		this.dlvr_idcard = dlvr_idcard;
		this.dlvr_date = dlvr_date;
		this.dlvr_state = dlvr_state;
		this.dlvr_point = dlvr_point;
		this.dlvr_rank = dlvr_rank;
	}

	public int getDlvr_no() {
		return dlvr_no;
	}

	public void setDlvr_no(int dlvr_no) {
		this.dlvr_no = dlvr_no;
	}

	public String getDlvr_id() {
		return dlvr_id;
	}

	public void setDlvr_id(String dlvr_id) {
		this.dlvr_id = dlvr_id;
	}

	public String getDlvr_pw() {
		return dlvr_pw;
	}

	public void setDlvr_pw(String dlvr_pw) {
		this.dlvr_pw = dlvr_pw;
	}

	public String getDlvr_name() {
		return dlvr_name;
	}

	public void setDlvr_name(String dlvr_name) {
		this.dlvr_name = dlvr_name;
	}

	public String getDlvr_phone() {
		return dlvr_phone;
	}

	public void setDlvr_phone(String dlvr_phone) {
		this.dlvr_phone = dlvr_phone;
	}

	public String getDlvr_email() {
		return dlvr_email;
	}

	public void setDlvr_email(String dlvr_email) {
		this.dlvr_email = dlvr_email;
	}

	public String getDlvr_addr() {
		return dlvr_addr;
	}

	public void setDlvr_addr(String dlvr_addr) {
		this.dlvr_addr = dlvr_addr;
	}

	public String getDlvr_img() {
		return dlvr_img;
	}

	public void setDlvr_img(String dlvr_img) {
		this.dlvr_img = dlvr_img;
	}

	public String getDlvr_idcard() {
		return dlvr_idcard;
	}

	public void setDlvr_idcard(String dlvr_idcard) {
		this.dlvr_idcard = dlvr_idcard;
	}

	public Date getDlvr_birth() {
		return dlvr_birth;
	}

	public void setDlvr_birth(Date dlvr_birth) {
		this.dlvr_birth = dlvr_birth;
	}

	public Timestamp getDlvr_date() {
		return dlvr_date;
	}

	public void setDlvr_date(Timestamp dlvr_date) {
		this.dlvr_date = dlvr_date;
	}

	public String getDlvr_state() {
		return dlvr_state;
	}

	public void setDlvr_state(String dlvr_state) {
		this.dlvr_state = dlvr_state;
	}

	public int getDlvr_point() {
		return dlvr_point;
	}

	public void setDlvr_point(int dlvr_point) {
		this.dlvr_point = dlvr_point;
	}

	public String getDlvr_rank() {
		return dlvr_rank;
	}

	public void setDlvr_rank(String dlvr_rank) {
		this.dlvr_rank = dlvr_rank;
	}

	@Override
	public String toString() {
		return "DeliverVo [dlvr_no=" + dlvr_no + ", dlvr_id=" + dlvr_id + ", dlvr_pw=" + dlvr_pw + ", dlvr_name="
				+ dlvr_name + ", dlvr_phone=" + dlvr_phone + ", dlvr_email=" + dlvr_email + ", dlvr_addr=" + dlvr_addr
				+ ", dlvr_img=" + dlvr_img + ", dlvr_idcard=" + dlvr_idcard + ", dlvr_date=" + dlvr_date
				+ ", dlvr_state=" + dlvr_state + ", dlvr_point=" + dlvr_point + ", dlvr_rank=" + dlvr_rank + "]";
	}

}
