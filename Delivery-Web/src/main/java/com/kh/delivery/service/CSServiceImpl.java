package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.CSDao;
import com.kh.delivery.domain.FAQVo;

@Service
public class CSServiceImpl implements CSService {

	@Inject
	CSDao csDao;
	
	
	@Override
	public List<FAQVo> getFAQList() throws Exception {
		List<FAQVo> FAQList = csDao.getFAQList();
		return FAQList;
	}

}