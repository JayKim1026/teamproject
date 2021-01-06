package com.kh.delivery.domain;

public class AccountDto {
	private String acc_id;
	private String acc_pw;
	private String acc_name;
	private String acc_email;
	private String acc_phone;

	public String getAcc_id() {
		return acc_id;
	}

	public void setAcc_id(String acc_id) {
		this.acc_id = acc_id;
	}

	public String getAcc_pw() {
		return acc_pw;
	}

	public void setAcc_pw(String acc_pw) {
		this.acc_pw = acc_pw;
	}

	public String getAcc_name() {
		return acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public String getAcc_email() {
		return acc_email;
	}

	public void setAcc_email(String acc_email) {
		this.acc_email = acc_email;
	}

	public String getAcc_phone() {
		return acc_phone;
	}

	public void setAcc_phone(String acc_phone) {
		this.acc_phone = acc_phone;
	}

	@Override
	public String toString() {
		return "AccountDto [acc_id=" + acc_id + ", acc_pw=" + acc_pw + ", acc_name=" + acc_name + ", acc_email="
				+ acc_email + ", acc_phone=" + acc_phone + "]";
	}

}
