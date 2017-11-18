package com.oblong.gjgwms.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oblong.gjgwms.dao.InventoryMapper;
import com.oblong.gjgwms.dao.StoreMapper;
import com.oblong.gjgwms.dao.Store_detailMapper;
import com.oblong.gjgwms.entity.Inventory;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.entity.Store;
import com.oblong.gjgwms.entity.Store_detail;
import com.oblong.gjgwms.service.StoreService;

@Service(value = "storeService")
public class StoreServiceImpl extends BaseServiceImpl<Store> implements StoreService {
	@Autowired
	protected StoreMapper storeMapper;
	
	@Autowired
	protected Store_detailMapper store_detailMapper;
	
	@Autowired
	protected InventoryMapper inventoryMapper;
	
	@Override
	public int insertStore(Store store) throws Exception {
		int i=0;
		String storeId=UUID.randomUUID().toString().replace("-", "");
		store.setStoreId(storeId);
		i = storeMapper.insert(store);
		for(Store_detail sd : store.getStoreDetail()){
			sd.setStoreDetailId(UUID.randomUUID().toString().replace("-", ""));
			sd.setStoreId(storeId);
			Inventory inventory=new Inventory();
			inventory.setInventoryId(sd.getInventoryId());
			Integer inventoryAmount = inventoryMapper.selectAmount(inventory.getInventoryId());
			inventoryAmount=sd.getStoreAmount()+inventoryAmount;
			inventory.setInventoryAmount(inventoryAmount);
			inventoryMapper.updateAmount(inventory);
		}
		store_detailMapper.insertList(store.getStoreDetail());
		return i;
	}

	@Override
	public Page<Store> selectPage(Page<Store> page) {
		page.setList(storeMapper.selectPageList(page));
		page.setTotalRecord(storeMapper.selectPageCount());
		return page;
	}

	@Override
	public Page<Store_detail> selectPageUseId(Page<Store_detail> page) {
		page.setList(store_detailMapper.selectPageListUseId(page));
		page.setTotalRecord(store_detailMapper.selectPageCountUseId(page));
		return page;
	}


}
