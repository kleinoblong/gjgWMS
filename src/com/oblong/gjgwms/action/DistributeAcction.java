package com.oblong.gjgwms.action;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oblong.gjgwms.entity.Account;
import com.oblong.gjgwms.entity.Distribute;
import com.oblong.gjgwms.entity.Distribute_detail;
import com.oblong.gjgwms.entity.Employee;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.DistributeService;

@Controller
@RequestMapping(value = "/distribute")
public class DistributeAcction extends BaseAction {
	@Resource
	private DistributeService distributeService;
	
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Object insert(Distribute distribute, Employee employee,String rows, HttpSession session) {
		// 提供json格式数据转java对象
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(distribute);
		System.out.println(employee);
		System.out.println(rows);
		int i = 0;
		int m = 0;
		if (rows.length() < 3) {
			return i;
		} else {
			try {
				Distribute_detail[] Distribute_detail = mapper.readValue(rows, Distribute_detail[].class);
				for (Distribute_detail dd : Distribute_detail) {
					System.out.println(dd);
					if (dd.getDistributeAmount() == null) {
						m++;
					}
				}
				if (m == 0) {
					distribute.setDistributeDetail(Arrays.asList(Distribute_detail));
					distribute.setEmployee(employee);
					Account login = (Account) session.getAttribute("account");
					distribute.setAccount(login);
					i = distributeService.insertDistribute(distribute);
				} else {
					return i;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return i;
	}
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping("/selectPage")
	@ResponseBody
	public Object selectPage(Page<Distribute> page, Distribute distribute) {
		page.setParamEntity(distribute);
		Page<Distribute> p = distributeService.selectPage(page);
		return p.getPageMap();
	}
	
	@RequestMapping("/selectPageUseId")
	@ResponseBody
	public Object selectPageUseId(Page<Distribute_detail> page, Distribute_detail dd) {
		page.setParamEntity(dd);
		Page<Distribute_detail> p = distributeService.selectPageUseId(page);
		return p.getPageMap();
	}
}
