package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.AccountDto;

@Repository
public class AccountDaoImpl implements AccountDao {
	
	private final static String NAMESPACE = "com.kh.delivery.account.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public boolean checkIdDupl(String acc_id) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("acc_id", acc_id);
		String id = sqlSession.selectOne(NAMESPACE + "checkIdDupl", map);
		if(id == null || id.equals("")) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String findAccountId(AccountDto accountDto) throws Exception {
		String acc_id = sqlSession.selectOne(NAMESPACE + "findAccountId", accountDto);
		return acc_id;
	}

	@Override
	public String findAccountPw(AccountDto accountDto) throws Exception {
		String acc_pw = sqlSession.selectOne(NAMESPACE + "findAccountPw", accountDto);
		return acc_pw;
	}

}
