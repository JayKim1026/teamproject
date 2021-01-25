package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.FAQVo;

public interface CSService {
	
	/* FAQ 페이지에서 검색 
	 * category 검색 옵션
	 * keyword 검색할 단어
	 * */
	public List<FAQVo> getSearchList (String category, String keyword) throws Exception;
}
