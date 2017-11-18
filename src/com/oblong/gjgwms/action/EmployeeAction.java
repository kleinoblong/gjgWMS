package com.oblong.gjgwms.action;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.oblong.gjgwms.entity.Department;
import com.oblong.gjgwms.entity.Employee;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.EmployeeService;
@Controller
@RequestMapping(value = "/employee")
public class EmployeeAction extends BaseAction {
	@Resource
	private EmployeeService employeeService;
	// 通过关键字分页查询所有条目
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody 
	public Object selectPageUseDyc(Page<Employee> page, Employee employee) {
		page.setParamEntity(employee);
		Page<Employee> p = employeeService.selectPageUseDyc(page);
		return p.getPageMap();
	}
	// 通过批量修改物资状态为失效
	@RequestMapping("/disable")
	@ResponseBody 
	public Object disable(String[] pks) {
		int i = 0;
		try {
			i = employeeService.disable(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	// 通过批量修改物资状态为生效
	@RequestMapping("/enable")
	@ResponseBody 
	public Object enable(String[] pks) {
		int i = 0;
		try {
			i = employeeService.enable(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	// 添加物资数据(不包括数量)
	@RequestMapping("/insert")
	@ResponseBody 
	public Object insert(Employee employee,Department department) {
		employee.setDepartment(department);
		int i = 0;
		try {
			i = employeeService.insert(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	// 修改物资数据(不包括ID,状态,数量)
	@RequestMapping("/update")
	@ResponseBody 
	public Object update(Employee employee,Department department) {
		int i = 0;
		employee.setDepartment(department);
		System.out.println("_____________EmployeeAction.insert()___________"+employee);
		try {
			i = employeeService.update(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	// 通过关键字分页查询所有有效条目
	@RequestMapping("/selectPageUseDycStatus")
	@ResponseBody 
	public Object selectPageUseDycStatus(Page<Employee> page, Employee employee) {
		page.setParamEntity(employee);
		Page<Employee> p = employeeService.selectPageUseDycStatus(page);
		return p.getPageMap();
	}
}
