package com.oblong.gjgwms.entity;

import java.io.Serializable;

public class Employee implements Serializable{

	private static final long serialVersionUID = -2941634749609779791L;

	private String employeeId;

    private String employeeName;

    private Integer employeeStatus;

    private Department department;

    
    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }


    public Integer getEmployeeStatus() {
        return employeeStatus;
    }

    public void setEmployeeStatus(Integer employeeStatus) {
        this.employeeStatus = employeeStatus;
    }

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeStatus="
				+ employeeStatus + ", department=" + department + "]";
	}


    
}