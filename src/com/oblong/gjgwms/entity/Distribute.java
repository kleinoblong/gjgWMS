package com.oblong.gjgwms.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Distribute implements Serializable{

	private static final long serialVersionUID = 8936288107611072231L;

	private String distributeId;

    private Account account;

    private Date distributeDate;

    private Employee  employee;
    
    private List<Distribute_detail> distributeDetail;

	public String getDistributeId() {
		return distributeId;
	}

	public void setDistributeId(String distributeId) {
		this.distributeId = distributeId;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Date getDistributeDate() {
		return distributeDate;
	}

	public void setDistributeDate(Date distributeDate) {
		this.distributeDate = distributeDate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}



	public List<Distribute_detail> getDistributeDetail() {
		return distributeDetail;
	}

	public void setDistributeDetail(List<Distribute_detail> distributeDetail) {
		this.distributeDetail = distributeDetail;
	}

	@Override
	public String toString() {
		return "Distribute [distributeId=" + distributeId + ", account=" + account + ", distributeDate="
				+ distributeDate + ", employee=" + employee + ", distributeDetail=" + distributeDetail + "]";
	}

	
}