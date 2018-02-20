package com.gxzn.forestoa.modules.sys.entity;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;

public class Users extends PageInfo<Users> {
	private Long userId;

	private String userNumber;

	private String userName;

	private String sex;

	private String phone;

	private String email;

	private String loginName;

	private String loginPassword;

	private Date creatTime;

	private String userStatus;

	private String delFlag;

	private Long orgId;

	private String orgStatus;

	private String userType;

	private Long orgId1;

	private Long roleId1;

	private Long orgId2;

	private Long roleId2;

	private Long orgId3;

	private Long roleId3;

	private Long orgId4;

	private Long roleId4;

	private Long orgId5;

	private Long roleId5;

	private String remarks;

	private String orgs;

	List<Menu> reandmenus;// 可用菜单

	public String getOrgs() {
		return orgs;
	}

	public void setOrgs(String orgs) {
		this.orgs = orgs;
	}

	public List<Menu> getReandmenus() {
		return reandmenus;
	}

	public void setReandmenus(List<Menu> reandmenus) {
		this.reandmenus = reandmenus;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber == null ? null : userNumber.trim();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName == null ? null : loginName.trim();
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword == null ? null : loginPassword.trim();
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus == null ? null : userStatus.trim();
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag == null ? null : delFlag.trim();
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public String getOrgStatus() {
		return orgStatus;
	}

	public void setOrgStatus(String orgStatus) {
		this.orgStatus = orgStatus == null ? null : orgStatus.trim();
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Long getOrgId1() {
		return orgId1;
	}

	public void setOrgId1(Long orgId1) {
		this.orgId1 = orgId1;
	}

	public Long getRoleId1() {
		return roleId1;
	}

	public void setRoleId1(Long roleId1) {
		this.roleId1 = roleId1;
	}

	public Long getOrgId2() {
		return orgId2;
	}

	public void setOrgId2(Long orgId2) {
		this.orgId2 = orgId2;
	}

	public Long getRoleId2() {
		return roleId2;
	}

	public void setRoleId2(Long roleId2) {
		this.roleId2 = roleId2;
	}

	public Long getOrgId3() {
		return orgId3;
	}

	public void setOrgId3(Long orgId3) {
		this.orgId3 = orgId3;
	}

	public Long getRoleId3() {
		return roleId3;
	}

	public void setRoleId3(Long roleId3) {
		this.roleId3 = roleId3;
	}

	public Long getOrgId4() {
		return orgId4;
	}

	public void setOrgId4(Long orgId4) {
		this.orgId4 = orgId4;
	}

	public Long getRoleId4() {
		return roleId4;
	}

	public void setRoleId4(Long roleId4) {
		this.roleId4 = roleId4;
	}

	public Long getOrgId5() {
		return orgId5;
	}

	public void setOrgId5(Long orgId5) {
		this.orgId5 = orgId5;
	}

	public Long getRoleId5() {
		return roleId5;
	}

	public void setRoleId5(Long roleId5) {
		this.roleId5 = roleId5;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks == null ? null : remarks.trim();
	}
}
