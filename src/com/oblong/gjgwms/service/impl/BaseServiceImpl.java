package com.oblong.gjgwms.service.impl;

import java.util.List;

import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {

	@Override
	public int insert(T entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(T entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(T entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public T select(T entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<T> selectPage(Page<T> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<T> selectPageUseDyc(Page<T> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int disable(String[] pks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int enable(String[] pks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<T> select() {
		// TODO Auto-generated method stub
		return null;
	}

}
