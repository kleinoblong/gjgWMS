package com.oblong.gjgwms.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oblong.gjgwms.dao.EmployeeMapper;
import com.oblong.gjgwms.entity.Employee;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.EmployeeService;

@Service(value = "employeeService")
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements EmployeeService {
	@Autowired
	protected EmployeeMapper employeeMapper;

	@Override
	//分页
	public Page<Employee> selectPageUseDyc(Page<Employee> page) {
		page.setList(employeeMapper.selectPageListUseDyc(page));
		page.setTotalRecord(employeeMapper.selectPageCountUseDyc(page));
		return page;
	}


	@Override
	//插入信息
	public int insert(Employee entity) throws Exception {
		String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
		entity.setEmployeeId(uuid);
		return employeeMapper.insert(entity);
	}

	@Override
	//设置为离职
	public int disable(String[] pks) {	
		return employeeMapper.disable(pks);
	}
	
	@Override
	//设置为在职
	public int enable(String[] pks) {
		return employeeMapper.enable(pks);
	}

	@Override
	//更新信息
	public int update(Employee entity) throws Exception {
		return employeeMapper.update(entity);
	}


	@Override
	public Page<Employee> selectPageUseDycStatus(Page<Employee> page) {
		page.setList(employeeMapper.selectPageListUseDycStatus(page));
		page.setTotalRecord(employeeMapper.selectPageCountUseDycStatus(page));
		return page;
	}
}
