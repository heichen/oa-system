package com.gxzn.forestoa.modules.workplan.entity;

import java.sql.Date;

import com.gxzn.forestoa.modules.sys.entity.Users;

public class Workplan {
	private Long workplanId;

    private String workplanTitle;

    private String workplanContent;

    private Long workplanOwner;

    private Date workplanStarttime;

    private Date workplanEndtime;

    private Date workplanNoticetime;

    private String delFlag;

    private String status;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;
    
    private Users user;
    
    

    public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Long getWorkplanId() {
        return workplanId;
    }

    public void setWorkplanId(Long workplanId) {
        this.workplanId = workplanId;
    }

    public String getWorkplanTitle() {
        return workplanTitle;
    }

    public void setWorkplanTitle(String workplanTitle) {
        this.workplanTitle = workplanTitle == null ? null : workplanTitle.trim();
    }

    public String getWorkplanContent() {
        return workplanContent;
    }

    public void setWorkplanContent(String workplanContent) {
        this.workplanContent = workplanContent == null ? null : workplanContent.trim();
    }

    public Long getWorkplanOwner() {
        return workplanOwner;
    }

    public void setWorkplanOwner(Long workplanOwner) {
        this.workplanOwner = workplanOwner;
    }

    public Date getWorkplanStarttime() {
        return workplanStarttime;
    }

    public void setWorkplanStarttime(Date workplanStarttime) {
        this.workplanStarttime = workplanStarttime;
    }

    public Date getWorkplanEndtime() {
        return workplanEndtime;
    }

    public void setWorkplanEndtime(Date workplanEndtime) {
        this.workplanEndtime = workplanEndtime;
    }

    public Date getWorkplanNoticetime() {
        return workplanNoticetime;
    }

    public void setWorkplanNoticetime(Date workplanNoticetime) {
        this.workplanNoticetime = workplanNoticetime;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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

    public String getRemarks4() {
        return remarks4;
    }

    public void setRemarks4(String remarks4) {
        this.remarks4 = remarks4 == null ? null : remarks4.trim();
    }
}