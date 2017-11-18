package com.oblong.gjgwms.dao;

import com.oblong.gjgwms.entity.Distribute;

public interface DistributeMapper  extends BaseMapper<Distribute>{
	public Integer selectPageCount();
}