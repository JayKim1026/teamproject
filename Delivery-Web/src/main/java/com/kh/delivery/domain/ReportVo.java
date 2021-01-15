package com.kh.delivery.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReportVo {
	// 테이블 컬럼
	private int report_no;
	private int plt_no;
	private int def_no;
	private String report_code;
	private String report_state;
	private String report_type;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Timestamp report_date;
	private int admin_no;

	// 조인 컬럼
	private String plt_name;
	private String def_name;
	private String admin_name;
	private String report_detail;
	private String state_detail;
	private String type_detail;

	public String getReport_detail() {
		return report_detail;
	}

	public void setReport_detail(String report_detail) {
		this.report_detail = report_detail;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getState_detail() {
		return state_detail;
	}

	public void setState_detail(String state_detail) {
		this.state_detail = state_detail;
	}

	public String getType_detail() {
		return type_detail;
	}

	public void setType_detail(String type_detail) {
		this.type_detail = type_detail;
	}

	public String getPlt_name() {
		return plt_name;
	}

	public void setPlt_name(String plt_name) {
		this.plt_name = plt_name;
	}

	public String getDef_name() {
		return def_name;
	}

	public void setDef_name(String def_name) {
		this.def_name = def_name;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getPlt_no() {
		return plt_no;
	}

	public void setPlt_no(int plt_no) {
		this.plt_no = plt_no;
	}

	public int getDef_no() {
		return def_no;
	}

	public void setDef_no(int def_no) {
		this.def_no = def_no;
	}

	public String getReport_state() {
		return report_state;
	}

	public void setReport_state(String report_state) {
		this.report_state = report_state;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public Timestamp getReport_date() {
		return report_date;
	}

	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getReport_code() {
		return report_code;
	}

	public void setReport_code(String report_code) {
		this.report_code = report_code;
	}

	@Override
	public String toString() {
		return "ReportVo [report_no=" + report_no + ", plt_no=" + plt_no + ", def_no=" + def_no + ", report_code="
				+ report_code + ", report_state=" + report_state + ", report_type=" + report_type + ", report_date="
				+ report_date + ", admin_no=" + admin_no + ", plt_name=" + plt_name + ", def_name=" + def_name
				+ ", admin_name=" + admin_name + ", report_detail=" + report_detail + ", state_detail=" + state_detail
				+ ", type_detail=" + type_detail + "]";
	}

}
