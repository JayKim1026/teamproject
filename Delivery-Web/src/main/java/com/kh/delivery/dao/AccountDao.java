package com.kh.delivery.dao;

import com.kh.delivery.domain.AccountDto;

public interface AccountDao {
	public boolean checkIdDupl(String acc_id) throws Exception;
	public String findAccountId(AccountDto accountDto) throws Exception;
	public String findAccountPw(AccountDto accountDto) throws Exception;
}
