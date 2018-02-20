package com.gxzn.forestoa.modules.attendance.entity;

import java.util.Date;

import com.gxzn.forestoa.modules.sys.entity.Users;

public class Attendance { 
	private Long attenceId;

	private Long userNumber;

	private Date attenceStarttime;

	private Date attenceEndtime;

	private String remarks1;

	private String remarks2;

	private String remarks3;

	private Users user;
	
	private String currentTime;

	private String AttState; // 考勤状态 默认 0--Check-In; 1--Check-Out; 2--Break-Out; 3--Break-In; 4--OT-In;
								// 5--OT-Out

	private String VerifyMethod; // 验证方式 0:密码验证 1:指纹验证 2:卡验证
	
	

	public String getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}

	public String getAttState() {
		return AttState;
	}

	public void setAttState(String attState) {
		AttState = attState;
	}

	public String getVerifyMethod() {
		return VerifyMethod;
	}

	public void setVerifyMethod(String verifyMethod) {
		VerifyMethod = verifyMethod;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Long getAttenceId() {
		return attenceId;
	}

	public void setAttenceId(Long attenceId) {
		this.attenceId = attenceId;
	}

	public Long getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Long userNumber) {
		this.userNumber = userNumber;
	}

	public Date getAttenceStarttime() {
		return attenceStarttime;
	}

	public void setAttenceStarttime(Date attenceStarttime) {
		this.attenceStarttime = attenceStarttime;
	}

	public Date getAttenceEndtime() {
		return attenceEndtime;
	}

	public void setAttenceEndtime(Date attenceEndtime) {
		this.attenceEndtime = attenceEndtime;
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
