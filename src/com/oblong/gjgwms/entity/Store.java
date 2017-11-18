package com.oblong.gjgwms.entity;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
public class Store implements Serializable {
	private static final long serialVersionUID = 1053254622654121822L;
	private String storeId;
	private Account account;
	private Date storeDate;
	private List<Store_detail> storeDetail;
	public List<Store_detail> getStoreDetail() {
		return storeDetail;
	}
	public void setStoreDetail(List<Store_detail> storeDetail) {
		this.storeDetail = storeDetail;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public Date getStoreDate() {
		return storeDate;
	}
	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", account=" + account + ", storeDate=" + storeDate + ", storeDetail="
				+ storeDetail + "]";
	}
}