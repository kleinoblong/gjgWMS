package com.oblong.gjgwms.dao;

import com.oblong.gjgwms.entity.Department;

public interface DepartmentMapper extends BaseMapper<Department>{
    //查询指定部门的员工数量
	public int selectCount(String id);
	
	public Integer selectPageCount();
	
	// 删除单个对象
	public int delete(String id);
}