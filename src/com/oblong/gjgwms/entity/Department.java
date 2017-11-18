package com.oblong.gjgwms.entity;

import java.io.Serializable;

public class Department implements Serializable{

	private static final long serialVersionUID = 7805164632310509952L;

	private String departmentId;

    private String departmentName;

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

	@Override
	public String toString() {
		return "Department [departmentId=" + departmentId + ", departmentName=" + departmentName + "]";
	}
    
    
}