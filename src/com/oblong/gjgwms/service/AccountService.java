package com.oblong.gjgwms.service;

import com.oblong.gjgwms.entity.Account;

public interface AccountService extends BaseService<Account> {
	public Account login(Account account);
	public int updatePwd(Account account);
}
