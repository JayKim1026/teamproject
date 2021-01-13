package com.kh.delivery.domain;

public class LikeVo {

	private int time_no;
	private int account_no;

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	@Override
	public String toString() {
		return "LikeVo [time_no=" + time_no + ", account_no=" + account_no + "]";
	}

}
