package com.kh.delivery.domain;

public class FAQVo {

	// 테이블 컬럼
	private int faq_no;
	private String faq_title;
	private String faq_content;
	private String faq_state;
	
	// 조인 컬럼
	private String code_detail;
		

	public String getCode_detail() {
		return code_detail;
	}
	public void setCode_detail(String code_detail) {
		this.code_detail = code_detail;
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_state() {
		return faq_state;
	}
	public void setFaq_state(String faq_state) {
		this.faq_state = faq_state;
	}
	
	@Override
	public String toString() {
		return "FAQVo [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_content=" + faq_content + ", faq_state="
				+ faq_state + ", code_detail=" + code_detail + "]";
	}
	
	
}
