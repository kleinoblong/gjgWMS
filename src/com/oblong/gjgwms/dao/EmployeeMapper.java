package com.oblong.gjgwms.dao;

import java.util.List;

import com.oblong.gjgwms.entity.Employee;
import com.oblong.gjgwms.entity.Page;

public interface EmployeeMapper extends BaseMapper<Employee> {
	// 通过关键字分页查询生效数据列表
	public List<Employee> selectPageListUseDycStatus(Page<Employee> page);

	// 通过关键字分页查询，返回生效物资总记录数
	public Integer selectPageCountUseDycStatus(Page<Employee> page);
}