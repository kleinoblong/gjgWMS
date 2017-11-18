package com.oblong.gjgwms.service;

import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.entity.Store;
import com.oblong.gjgwms.entity.Store_detail;

public interface StoreService extends BaseService<Store> {
	public int insertStore(Store store) throws Exception;
	
	public Page<Store_detail> selectPageUseId(Page<Store_detail> page);

}
