package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.AccountDto;

public interface AccountService {
	// 아이디 중복 확인
	public boolean checkIdDupl(String acc_id) throws Exception;
	// 아이디 찾기
	public String findAccountId(AccountDto accountDto) throws Exception;
	// 비밀번호 찾기
	public String findAccountPw(AccountDto accountDto) throws Exception;
	// 포인트 랭킹 조회
	public List<AccountDto> getPointRank() throws Exception;
}
