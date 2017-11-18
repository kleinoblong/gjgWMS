package com.oblong.gjgwms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oblong.gjgwms.dao.AccountMapper;
import com.oblong.gjgwms.entity.Account;
import com.oblong.gjgwms.service.AccountService;

@Service(value="accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {

	@Autowired
	private AccountMapper accountMapper;
	@Override
	public Account login(Account account) {
		return accountMapper.login(account);
	}
	@Override
	public int updatePwd(Account account) {
		return accountMapper.updatePwd(account);
	}

}
