package com.oblong.gjgwms.entity;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Distribute_detail implements Serializable{
	

	private static final long serialVersionUID = 2410859444789005430L;

	private String distributeDetailId;

    private Inventory inventory;
    
	private String inventoryId;

    private Integer distributeAmount;

    private String distributeId;

	public String getDistributeDetailId() {
		return distributeDetailId;
	}

	public void setDistributeDetailId(String distributeDetailId) {
		this.distributeDetailId = distributeDetailId;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public Integer getDistributeAmount() {
		return distributeAmount;
	}

	public void setDistributeAmount(Integer distributeAmount) {
		this.distributeAmount = distributeAmount;
	}

	public String getDistributeId() {
		return distributeId;
	}

	public void setDistributeId(String distributeId) {
		this.distributeId = distributeId;
	}

	public String getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(String inventoryId) {
		this.inventoryId = inventoryId;
	}

	@Override
	public String toString() {
		return "Distribute_detail [distributeDetailId=" + distributeDetailId + ", inventory=" + inventory
				+ ", inventoryId=" + inventoryId + ", distributeAmount=" + distributeAmount + ", distributeId="
				+ distributeId + "]";
	}


    
}