package com.oblong.gjgwms.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oblong.gjgwms.entity.Department;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.DepartmentService;

@Controller
@RequestMapping(value = "/department")
public class DepartmentAction extends BaseAction {

	@Resource
	private DepartmentService departmentService;

	// 添加物资数据(不包括数量)
	@RequestMapping("/insert")
	@ResponseBody 
	public Object insert(Department department) {
		int i = 0;
		try {
			i = departmentService.insert(department);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	// 通过查询所有条目
	@RequestMapping("/select")
	@ResponseBody 
	public Object select() {
		return departmentService.select();
	}
	
	// 通过分页查询所有条目
	@RequestMapping("/selectPage")
	@ResponseBody 
	public Object selectPage(Page<Department> page, Department department,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(department);
			Page<Department> p = departmentService.selectPage(page);
			return p.getPageMap();
		}else{
			return null;
		}	
		
	}

	// 修改部门数据(不包括ID)
	@RequestMapping("/update")
	@ResponseBody 
	public Object update(Department department) {
		int i = 0;	
		try {
			i = departmentService.update(department);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	// 修改部门数据(不包括ID)
	@RequestMapping("/delete")
	@ResponseBody 
	public Object delete(String pk) {
		int i = 0;	
		System.out.println(pk);
		try {
			if(departmentService.selectCount(pk)==0){
				i = departmentService.delete(pk);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	// 
	@RequestMapping("/selectCount")
	@ResponseBody 
	public Object selectCount(String id) {
		int i = 0;	
		try {
			i = departmentService.selectCount(id);
			if(i==0){
				return "forward:/department/delete";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
}
