package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.domain.AccountDto;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Inject
	AccountDao accountDao;

	@Override
	public boolean checkIdDupl(String acc_id) throws Exception {
		boolean result = accountDao.checkIdDupl(acc_id);
		return result;
	}

	@Override
	public String findAccountId(AccountDto accountDto) throws Exception {
		String acc_id = accountDao.findAccountId(accountDto);
		return acc_id;
	}

	@Override
	public String findAccountPw(AccountDto accountDto) throws Exception {
		String acc_pw = accountDao.findAccountPw(accountDto);
		return acc_pw;
	}

	@Override
	public List<AccountDto> getPointRank() throws Exception {
		List<AccountDto> pointRank = accountDao.getPointRank();
		return pointRank;
	}

}
