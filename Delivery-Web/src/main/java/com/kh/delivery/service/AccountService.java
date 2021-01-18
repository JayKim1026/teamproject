package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.AccountDto;

public interface AccountService {
	public boolean checkIdDupl(String acc_id) throws Exception;
	public String findAccountId(AccountDto accountDto) throws Exception;
	public String findAccountPw(AccountDto accountDto) throws Exception;
	public List<AccountDto> getPointRank() throws Exception;
}
