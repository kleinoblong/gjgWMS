package com.oblong.gjgwms.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oblong.gjgwms.dao.DepartmentMapper;
import com.oblong.gjgwms.entity.Department;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.DepartmentService;

@Service(value = "departmentService")
public class DepartmentServiceImpl extends BaseServiceImpl<Department> implements DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public int insert(Department entity) throws Exception {
		String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
		entity.setDepartmentId(uuid);
		return departmentMapper.insert(entity);
	}

	@Override
	public int selectCount(String id) {
		return departmentMapper.selectCount(id);
	}
	
	@Override
	public int delete(String id) throws Exception {
		System.out.println("id--------------"+id);
		return departmentMapper.delete(id);
	}

	@Override
	public int update(Department entity) throws Exception {
		return departmentMapper.update(entity);
	}
	
	@Override
	public Page<Department> selectPage(Page<Department> page) {
		page.setList(departmentMapper.selectPageList(page));
		page.setTotalRecord(departmentMapper.selectPageCount());
		return page;
	}

	@Override
	public List<Department> select() {
		return departmentMapper.select();
	}
}
