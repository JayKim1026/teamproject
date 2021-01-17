package com.kh.delivery.domain;

import java.sql.Timestamp;

public class AdminVo {
	private int admin_no;
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_phone;
	private String admin_email;
	private Timestamp admin_date;
	private String admin_state;
	private String account_state;
	private String admin_img;
	
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public Timestamp getAdmin_date() {
		return admin_date;
	}
	public void setAdmin_date(Timestamp admin_date) {
		this.admin_date = admin_date;
	}
	public String getAdmin_state() {
		return admin_state;
	}
	public void setAdmin_state(String admin_state) {
		this.admin_state = admin_state;
	}
	public String getAccount_state() {
		return account_state;
	}
	public void setAccount_state(String account_state) {
		this.account_state = account_state;
	}
	public String getAdmin_img() {
		return admin_img;
	}
	public void setAdmin_img(String admin_img) {
		this.admin_img = admin_img;
	}
	
	@Override
	public String toString() {
		return "AdminVo [admin_no=" + admin_no + ", admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name="
				+ admin_name + ", admin_phone=" + admin_phone + ", admin_email=" + admin_email + ", admin_date="
				+ admin_date + ", admin_state=" + admin_state + ", account_state=" + account_state + ", admin_img="
				+ admin_img + "]";
	}
}
