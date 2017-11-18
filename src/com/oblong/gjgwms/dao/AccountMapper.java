package com.oblong.gjgwms.dao;

import com.oblong.gjgwms.entity.Account;

public interface AccountMapper extends BaseMapper<Account>{
	public Account login(Account account);
	public int updatePwd(Account account);
	
}