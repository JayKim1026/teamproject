package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.FAQVo;

public interface CSDao {

	//search
	public List<FAQVo> getSearchList(String category, String keyword) throws Exception;
}
