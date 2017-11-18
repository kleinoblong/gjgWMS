package com.oblong.gjgwms.entity;

import java.io.Serializable;

public class Inventory implements Serializable{

	private static final long serialVersionUID = 4816431450158647842L;

	private String inventoryId;

    private String inventoryName;

    private Integer inventoryAmount;

    private String inventoryType;

    private Integer inventoryMin;

    private String inventoryRemark;
    
    private Integer inventoryStatus;

    public String getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(String inventoryId) {
        //this.inventoryId = UUID.randomUUID().toString().replaceAll("\\-", "");
    	this.inventoryId = inventoryId;
    }

    public String getInventoryName() {
        return inventoryName;
    }

    public void setInventoryName(String inventoryName) {
        this.inventoryName = inventoryName;
    }

    public Integer getInventoryAmount() {
        return inventoryAmount;
    }

    public void setInventoryAmount(Integer inventoryAmount) {
        this.inventoryAmount = inventoryAmount;
    }

    public String getInventoryType() {
        return inventoryType;
    }

    public void setInventoryType(String inventoryType) {
        this.inventoryType = inventoryType;
    }

    public Integer getInventoryMin() {
        return inventoryMin;
    }

    public void setInventoryMin(Integer inventoryMin) {
        this.inventoryMin = inventoryMin;
    }

    public String getInventoryRemark() {
        return inventoryRemark;
    }

    public void setInventoryRemark(String inventoryRemark) {
        this.inventoryRemark = inventoryRemark;
    }

    
	public Integer getInventoryStatus() {
		return inventoryStatus;
	}

	public void setInventoryStatus(Integer inventoryStatus) {
		this.inventoryStatus = inventoryStatus;
	}

	@Override
	public String toString() {
		return "Inventory [inventoryId=" + inventoryId + ", inventoryName=" + inventoryName + ", inventoryAmount="
				+ inventoryAmount + ", inventoryType=" + inventoryType + ", inventoryMin=" + inventoryMin
				+ ", inventoryRemark=" + inventoryRemark + "]";
	}
    
    
}