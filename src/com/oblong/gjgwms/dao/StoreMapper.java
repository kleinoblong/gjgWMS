package com.oblong.gjgwms.dao;

import com.oblong.gjgwms.entity.Store;

public interface StoreMapper extends BaseMapper<Store>{
	public Integer selectPageCount();
}