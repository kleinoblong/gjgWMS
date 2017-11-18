package com.oblong.gjgwms.dao;

import java.util.List;

import com.oblong.gjgwms.entity.Inventory;
import com.oblong.gjgwms.entity.Page;

public interface InventoryMapper extends BaseMapper<Inventory> {
	// 通过关键字分页查询库存量小于预警值的数据列表
	public List<Inventory> selectPageListUseDycMin(Page<Inventory> page);

	// 通过关键字分页查询，返回库存量小于预警值的总记录数
	public Integer selectPageCountUseDycMin(Page<Inventory> page);

	// 通过多条件查询，返回数据集
	public List<Inventory> selectListUseDyc(Page<Inventory> page);

	// 通过多条件查询，返回存量小于预警值的数据集
	public List<Inventory> selectListUseDycMin(Page<Inventory> page);

	// 通过关键字分页查询生效数据列表
	public List<Inventory> selectPageListUseDycStatus(Page<Inventory> page);

	// 通过关键字分页查询，返回生效物资总记录数
	public Integer selectPageCountUseDycStatus(Page<Inventory> page);

	//查询现有库存数量
	public Integer selectAmount(String inventoryId);

	//更新现有库存数量
	public Integer updateAmount(Inventory inventory);
}