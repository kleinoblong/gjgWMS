package com.oblong.gjgwms.service;

import com.oblong.gjgwms.entity.Department;

public interface DepartmentService extends BaseService<Department> {
	// 查询指定部门的员工数量
	public int selectCount(String id);
	public int delete(String id) throws Exception;
}
