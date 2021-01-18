package com.kh.delivery.service;

import com.kh.delivery.domain.AccountDto;

public interface AccountService {
	public boolean checkIdDupl(String acc_id) throws Exception;
	public String findAccountId(AccountDto accountDto) throws Exception;
	public String findAccountPw(AccountDto accountDto) throws Exception;
	
}
