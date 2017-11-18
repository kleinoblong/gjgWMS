package com.oblong.gjgwms.service;

import com.oblong.gjgwms.entity.Distribute;
import com.oblong.gjgwms.entity.Distribute_detail;
import com.oblong.gjgwms.entity.Page;

public interface DistributeService extends BaseService<Distribute> {
	public int insertDistribute(Distribute distribute) throws Exception;
	
	public Page<Distribute_detail> selectPageUseId(Page<Distribute_detail> page);

}
