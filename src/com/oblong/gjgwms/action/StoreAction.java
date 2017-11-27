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
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.entity.Store;
import com.oblong.gjgwms.entity.Store_detail;
import com.oblong.gjgwms.service.StoreService;

@Controller
@RequestMapping(value = "/store")
public class StoreAction extends BaseAction {
	@Resource
	private StoreService storeService;

	/**
	 * 物资入库
	 * @param store
	 * @param rows
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Object insert(Store store, String rows, HttpSession session) {
		// 提供json格式数据转java对象
		ObjectMapper mapper = new ObjectMapper();
		int i = 0;
		int m = 0;
		if (rows.length() < 3) {
			return i;
		} else {
			try {
				Store_detail[] Store_detail = mapper.readValue(rows, Store_detail[].class);
				for (Store_detail sd : Store_detail) {
					if (sd.getStoreAmount() == null) {
						m++;
					}
				}
				if (m == 0) {
					store.setStoreDetail(Arrays.asList(Store_detail));
					Account login = (Account) session.getAttribute("account");
					store.setAccount(login);
					i = storeService.insertStore(store);
				} else {
					return i;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return i;
	}

	/**
	 * 格式化时间
	 * @param request
	 * @param binder
	 * @throws Exception
	 */
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	/**
	 * 查询入所有入库单
	 * @param page
	 * @param store
	 * @return
	 */
	@RequestMapping("/selectPage")
	@ResponseBody
	public Object selectPage(Page<Store> page, Store store,HttpSession session) {
		if(session.getAttribute("account")!=null){
			page.setParamEntity(store);
			Page<Store> p = storeService.selectPage(page);
			return p.getPageMap();
		}else{
			return null;
		}	
		
	}
	
	/**
	 * 按ID查询指定入库单条目的明细
	 * @param page
	 * @param store
	 * @return
	 */
	@RequestMapping("/selectPageUseId")
	@ResponseBody
	public Object selectPageUseId(Page<Store_detail> page, Store_detail sd) {
		page.setParamEntity(sd);
		Page<Store_detail> p = storeService.selectPageUseId(page);
		return p.getPageMap();

	}
	
}
