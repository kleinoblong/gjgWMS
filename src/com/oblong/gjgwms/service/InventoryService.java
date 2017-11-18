package com.oblong.gjgwms.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.oblong.gjgwms.entity.Inventory;
import com.oblong.gjgwms.entity.Page;

public interface InventoryService extends BaseService<Inventory> {
	public Page<Inventory> selectPageUseDycMin(Page<Inventory> page);
	
	public List<Inventory> selectListUseDyc(Page<Inventory> page);

	public void exportExcel(List<Inventory> list, ServletOutputStream outputStream);

	public List<Inventory> selectListUseDycMin(Page<Inventory> page);

	public Page<Inventory> selectPageUseDycStatus(Page<Inventory> page);


	
}
