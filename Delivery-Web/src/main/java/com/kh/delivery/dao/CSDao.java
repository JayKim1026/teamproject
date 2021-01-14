package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.FAQVo;

public interface CSDao {

	//FAQ 목록
	public List<FAQVo> getFAQList() throws Exception;
	
	//search
	public List<FAQVo> getSearchList(String category, String keyword) throws Exception;
}
