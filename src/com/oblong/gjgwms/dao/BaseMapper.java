package com.oblong.gjgwms.dao;

import java.util.List;

import com.oblong.gjgwms.entity.Page;

public interface BaseMapper<T> {
	// 添加单个对象
	public int insert(T entity);

	// 修改单个对象
	public int update(T entity);

	// 删除单个对象
	public int delete(T entity);

	// 查询单个对象
	public T select(T entity);
	
	// 查询所有对象数据集
	public List<T> select();

	// 通过主键（数组）批量删除数据
	public int deleteList(String[] pks);

	// 通过关键字分页查询数据列表
	public List<T> selectPageList(Page<T> page);

	// 通过关键字分页查询，返回总记录数
	public Integer selectPageCount(Page<T> page);

	// 通过关键字分页查询数据列表
	public List<T> selectPageListUseDyc(Page<T> page);

	// 通过关键字分页查询，返回总记录数
	public Integer selectPageCountUseDyc(Page<T> page);

	// 通过主键（数组）批量让数据失效
	public int disable(String[] pks);
	
	// 通过主键（数组）批量让数据失效
	public int enable(String[] pks);
}
