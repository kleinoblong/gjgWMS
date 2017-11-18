package com.oblong.gjgwms.entity;

import java.io.Serializable;
import java.util.UUID;

public class Account implements Serializable{

	private static final long serialVersionUID = -7416516928800703595L;

	private String accId;

    private String accLoginname;

    private String accName;

    private String accPwd;


    public String getAccId() {
		return accId;
	}

	public void setAccId(String accId) {
		this.accId = accId;
	}

	public void setAccId() {
        this.accId = UUID.randomUUID().toString().replaceAll("\\-", "");
    }

    public String getAccLoginname() {
        return accLoginname;
    }

    public void setAccLoginname(String accLoginname) {
        this.accLoginname = accLoginname;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public String getAccPwd() {
        return accPwd;
    }

    public void setAccPwd(String accPwd) {
        this.accPwd = accPwd;
    }

	@Override
	public String toString() {
		return "Account [accId=" + accId + ", accLoginname=" + accLoginname + ", accName=" + accName + ", accPwd="
				+ accPwd + "]";
	}
    
    
}