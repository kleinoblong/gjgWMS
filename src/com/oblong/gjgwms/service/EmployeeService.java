package com.oblong.gjgwms.service;

import com.oblong.gjgwms.entity.Employee;
import com.oblong.gjgwms.entity.Page;

public interface EmployeeService extends BaseService<Employee> {
	public Page<Employee> selectPageUseDycStatus(Page<Employee> page);
	
}
