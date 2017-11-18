package com.oblong.gjgwms.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oblong.gjgwms.dao.DistributeMapper;
import com.oblong.gjgwms.dao.Distribute_detailMapper;
import com.oblong.gjgwms.dao.InventoryMapper;
import com.oblong.gjgwms.entity.Distribute;
import com.oblong.gjgwms.entity.Distribute_detail;
import com.oblong.gjgwms.entity.Inventory;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.DistributeService;

@Service(value = "distributeService")
public class DistributeServiceImpl extends BaseServiceImpl<Distribute> implements DistributeService {
	@Autowired
	protected DistributeMapper distributeMapper;
	
	@Autowired
	protected Distribute_detailMapper distribute_detailMapper;
	
	@Autowired
	protected InventoryMapper inventoryMapper;
	
	@Override
	public int insertDistribute(Distribute distribute) throws Exception {
		int i=0;
		String distributeId=UUID.randomUUID().toString().replace("-", "");
		distribute.setDistributeId(distributeId);
		i = distributeMapper.insert(distribute);
		for(Distribute_detail dd : distribute.getDistributeDetail()){
			dd.setDistributeDetailId(UUID.randomUUID().toString().replace("-", ""));
			dd.setDistributeId(distributeId);
			Inventory inventory=new Inventory();
			inventory.setInventoryId(dd.getInventoryId());
			Integer inventoryAmount = inventoryMapper.selectAmount(inventory.getInventoryId());
			inventoryAmount=inventoryAmount-dd.getDistributeAmount();
			if(inventoryAmount<0){
				return 0;
			}else{
				inventory.setInventoryAmount(inventoryAmount);
				inventoryMapper.updateAmount(inventory);		
			}
		}
		distribute_detailMapper.insertList(distribute.getDistributeDetail());
		return i;
	}

	@Override
	public Page<Distribute> selectPage(Page<Distribute> page) {
		page.setList(distributeMapper.selectPageList(page));
		page.setTotalRecord(distributeMapper.selectPageCount());
		return page;
	}

	@Override
	public Page<Distribute_detail> selectPageUseId(Page<Distribute_detail> page) {
		page.setList(distribute_detailMapper.selectPageListUseId(page));
		page.setTotalRecord(distribute_detailMapper.selectPageCountUseId(page));
		return page;
	}



}
