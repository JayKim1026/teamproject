package com.kh.delivery.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PointVo {
	// 테이블 컬럼
	private int point_no;
	private String point_code;
	private int account_no;
	private int point_score;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Timestamp point_date;

	// 조인 컬럼
	private String point_detail;
	private int total_score;
	private String account_name;

	public PointVo() {

	}

	public PointVo(String point_code, int account_no, int point_score) {
		this.point_code = point_code;
		this.account_no = account_no;
		this.point_score = point_score;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public int getTotal_score() {
		return total_score;
	}

	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}

	public String getPoint_detail() {
		return point_detail;
	}

	public void setPoint_detail(String point_detail) {
		this.point_detail = point_detail;
	}

	public int getPoint_no() {
		return point_no;
	}

	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}

	public String getPoint_code() {
		return point_code;
	}

	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	public int getPoint_score() {
		return point_score;
	}

	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}

	public Timestamp getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}

	@Override
	public String toString() {
		return "PointVo [point_no=" + point_no + ", point_code=" + point_code + ", account_no=" + account_no
				+ ", point_score=" + point_score + ", point_date=" + point_date + ", point_detail=" + point_detail
				+ ", total_score=" + total_score + ", account_name=" + account_name + "]";
	}

}
