package com.oblong.gjgwms.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oblong.gjgwms.entity.Inventory;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.InventoryService;

@Controller
@RequestMapping(value = "/inventory")
public class InventoryAction extends BaseAction {
	@Resource
	private InventoryService inventoryService;

	private String inventoryName = null;
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(new Date());

	// 通过关键字分页查询所有条目
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody 
	public Object selectPageUseDyc(Page<Inventory> page, Inventory inventory,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(inventory);
			inventoryName = page.getParamEntity().getInventoryName();
			Page<Inventory> p = inventoryService.selectPageUseDyc(page);
			return p.getPageMap();
		}else{
			return null;
		}	
	}

	// 通过关键字分页查询生效条目
	@RequestMapping("/selectPageUseDycStatus")
	@ResponseBody 
	public Object selectPageUseDycStatus(Page<Inventory> page, Inventory inventory,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(inventory);
			inventoryName = page.getParamEntity().getInventoryName();
			Page<Inventory> p = inventoryService.selectPageUseDycStatus(page);
			return p.getPageMap();
		}else{
			return null;
		}
		
	}
	// 通过关键字分页查询库存小于预警值的集合
	@RequestMapping("/selectPageUseDycMin")
	@ResponseBody 
	public Object selectPageUseDycMin(Page<Inventory> page, Inventory inventory,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(inventory);
			inventoryName = page.getParamEntity().getInventoryName();
			Page<Inventory> p = inventoryService.selectPageUseDycMin(page);
			return p.getPageMap();
		}else{
			return null;
		}
		
	}


	// 通过批量修改物资状态为失效
	@RequestMapping("/disable")
	@ResponseBody 
	public Object disable(String[] pks) {
		int i = 0;
		try {
			i = inventoryService.disable(pks);
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
			i = inventoryService.enable(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	// 添加物资数据(不包括数量)
	@RequestMapping("/insert")
	@ResponseBody 
	public Object insert(Inventory inventory) {
		int i = 0;
		try {
			i = inventoryService.insert(inventory);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	// 修改物资数据(不包括ID,状态,数量)
	@RequestMapping("/update")
	@ResponseBody 
	public Object update(Inventory inventory) {
		int i = 0;
		try {
			i = inventoryService.update(inventory);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	// 导出物资列表
	@RequestMapping("/exportExcel")
	public void exportExcel(Page<Inventory> page, Inventory inventory, HttpServletResponse response,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(inventory);
			inventory.setInventoryName(inventoryName);
			List<Inventory> list = inventoryService.selectListUseDyc(page);
			try {
				response.setContentType("application/x-excel");
				response.setHeader("Content-Disposition",
						"attachment;filename= " + date+"wzlb.xls");
				ServletOutputStream outputStream = response.getOutputStream();
				inventoryService.exportExcel(list, outputStream);
				if (outputStream != null) {
					outputStream.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	// 导出物资预警列表
	@RequestMapping("/exportWaringExcel")
	public void exportWaringExcel(Page<Inventory> page, Inventory inventory, HttpServletResponse response,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(inventory);
			inventory.setInventoryName(inventoryName);
			List<Inventory> list = inventoryService.selectListUseDycMin(page);
			try {
				response.setContentType("application/x-excel");
				response.setHeader("Content-Disposition",
						"attachment;filename= " + date+"yjlb.xls");
				ServletOutputStream outputStream = response.getOutputStream();
				inventoryService.exportExcel(list, outputStream);
				if (outputStream != null) {
					outputStream.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}
