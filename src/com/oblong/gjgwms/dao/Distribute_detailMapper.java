package com.oblong.gjgwms.dao;

import java.util.List;

import com.oblong.gjgwms.entity.Distribute_detail;
import com.oblong.gjgwms.entity.Page;

public interface Distribute_detailMapper extends BaseMapper<Distribute_detail>{
	public int insertList(List<Distribute_detail> distribute_detail);

	public Integer selectPageCountUseId(Page<Distribute_detail> page);

	public List<Distribute_detail> selectPageListUseId(Page<Distribute_detail> page);
}