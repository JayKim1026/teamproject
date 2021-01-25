package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.CSDao;
import com.kh.delivery.domain.FAQVo;

@Service
public class CSServiceImpl implements CSService {

	@Inject
	private CSDao csDao;
	
	
	/* FAQ 페이지에서 검색 
	 * category 검색 옵션
	 * keyword 검색할 단어
	 * */
	@Override
	public List<FAQVo> getSearchList (String category, String keyword) throws Exception {
		List<FAQVo> searchList = csDao.getSearchList(category, keyword);
		return searchList;
	}

}
