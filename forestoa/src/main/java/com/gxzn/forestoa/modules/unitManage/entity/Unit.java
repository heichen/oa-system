package com.gxzn.forestoa.modules.unitManage.entity;

public class Unit {
	 private Long id;

	    private String name;

	    private String manager;

	    private String phone;

	    private String status;

	    private String delFlag;

	    private String remarks1;

	    private String remarks2;

	    private String remarks3;

	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name == null ? null : name.trim();
	    }

	    public String getManager() {
	        return manager;
	    }

	    public void setManager(String manager) {
	        this.manager = manager == null ? null : manager.trim();
	    }

	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone == null ? null : phone.trim();
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status == null ? null : status.trim();
	    }

	    public String getDelFlag() {
	        return delFlag;
	    }

	    public void setDelFlag(String delFlag) {
	        this.delFlag = delFlag == null ? null : delFlag.trim();
	    }

	    public String getRemarks1() {
	        return remarks1;
	    }

	    public void setRemarks1(String remarks1) {
	        this.remarks1 = remarks1 == null ? null : remarks1.trim();
	    }

	    public String getRemarks2() {
	        return remarks2;
	    }

	    public void setRemarks2(String remarks2) {
	        this.remarks2 = remarks2 == null ? null : remarks2.trim();
	    }

	    public String getRemarks3() {
	        return remarks3;
	    }

	    public void setRemarks3(String remarks3) {
	        this.remarks3 = remarks3 == null ? null : remarks3.trim();
	    }

}
