package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.FAQVo;

public interface CSService {

	//FAQ 
	public List<FAQVo> getFAQList() throws Exception;
}