package com.oblong.gjgwms.dao;

import java.util.List;

import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.entity.Store_detail;

public interface Store_detailMapper extends BaseMapper<Store_detail>{
	public int insertList(List<Store_detail> store_detail);
	
	public Integer selectPageCountUseId(Page<Store_detail> page);
	
	public List<Store_detail> selectPageListUseId(Page<Store_detail> page);
}