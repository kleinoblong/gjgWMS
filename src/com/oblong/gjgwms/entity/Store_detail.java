package com.oblong.gjgwms.entity;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Store_detail implements Serializable {

	private static final long serialVersionUID = -2328768539190847825L;

	private String storeDetailId;

	private Inventory inventory;
	
	private String inventoryId;

	private Integer storeAmount;
	
	private String storeId;// 用于存放storeId

	public String getStoreDetailId() {
		return storeDetailId;
	}

	public void setStoreDetailId(String storeDetailId) {
		this.storeDetailId = storeDetailId;
	}


	public Integer getStoreAmount() {
		return storeAmount;
	}

	public void setStoreAmount(Integer storeAmount) {
		this.storeAmount = storeAmount;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {

		this.inventory = inventory;
	}

	
	public String getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(String inventoryId) {
		this.inventoryId = inventoryId;
	}

	@Override
	public String toString() {
		return "Store_detail [storeDetailId=" + storeDetailId + ", inventory=" + inventory + ", inventoryId="
				+ inventoryId + ", storeAmount=" + storeAmount + ", storeId=" + storeId + "]";
	}





}