package com.oblong.gjgwms.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oblong.gjgwms.dao.InventoryMapper;
import com.oblong.gjgwms.entity.Inventory;
import com.oblong.gjgwms.entity.Page;
import com.oblong.gjgwms.service.InventoryService;

@Service(value = "inventoryService")
public class InventoryServiceImpl extends BaseServiceImpl<Inventory> implements InventoryService {
	@Autowired
	protected InventoryMapper inventoryMapper;

	@Override
	public Page<Inventory> selectPageUseDyc(Page<Inventory> page) {
		page.setList(inventoryMapper.selectPageListUseDyc(page));
		page.setTotalRecord(inventoryMapper.selectPageCountUseDyc(page));
		return page;
	}

/*	@Override
	public int deleteList(String[] pks) throws Exception {
		return inventoryMapper.deleteList(pks);
	}*/

	@Override
	public int insert(Inventory entity) throws Exception {
		String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
		entity.setInventoryId(uuid);
		return inventoryMapper.insert(entity);
	}

	@Override
	public Page<Inventory> selectPageUseDycMin(Page<Inventory> page) {
		page.setList(inventoryMapper.selectPageListUseDycMin(page));
		page.setTotalRecord(inventoryMapper.selectPageCountUseDycMin(page));
		return page;
	}

	@Override
	public List<Inventory> selectListUseDyc(Page<Inventory> page) {
		return inventoryMapper.selectListUseDyc(page);
	}

	@Override
	public void exportExcel(List<Inventory> list, ServletOutputStream outputStream) {
		try {
			// 创建工作薄
			HSSFWorkbook workBook = new HSSFWorkbook();
			// 在工作薄中创建一工作表
			HSSFSheet sheet = workBook.createSheet("库存列表");
			// 创建表头
			HSSFRow row = sheet.createRow(0);
			String[] titles = {"名称", "数量", "规格", "预警值", "备注" };
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell = row.createCell(i);
				cell.setCellValue(titles[i]);
			}
			// 把LIST写入EXCEL
			if (list != null) {
				for (int j = 0; j < list.size(); j++) {
					HSSFRow row1 = sheet.createRow(j + 1);
					/*HSSFCell cell11 = row1.createCell(0);
					cell11.setCellValue(list.get(j).getInventoryId());*/
					HSSFCell cell12 = row1.createCell(0);
					cell12.setCellValue(list.get(j).getInventoryName());
					HSSFCell cell13 = row1.createCell(1);
					cell13.setCellValue(list.get(j).getInventoryAmount());
					HSSFCell cell14 = row1.createCell(2);
					cell14.setCellValue(list.get(j).getInventoryType());
					HSSFCell cell15 = row1.createCell(3);
					cell15.setCellValue(list.get(j).getInventoryMin());
					HSSFCell cell16 = row1.createCell(4);
					cell16.setCellValue(list.get(j).getInventoryRemark());
				}

			}
			// 写入EXCEL
			workBook.write(outputStream);
			System.out.println("写入成功");
			workBook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Inventory> selectListUseDycMin(Page<Inventory> page) {
		return inventoryMapper.selectListUseDycMin(page);
	}

	@Override
	public int disable(String[] pks) {	
		return inventoryMapper.disable(pks);
	}
	
	@Override
	public int enable(String[] pks) {
		return inventoryMapper.enable(pks);
	}

	@Override
	public Page<Inventory> selectPageUseDycStatus(Page<Inventory> page) {
		page.setList(inventoryMapper.selectPageListUseDycStatus(page));
		page.setTotalRecord(inventoryMapper.selectPageCountUseDycStatus(page));
		return page;
	}
	
	@Override
	public int update(Inventory entity) throws Exception {
		return inventoryMapper.update(entity);
	}


}
