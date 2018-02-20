package com.gxzn.forestoa.modules.sys.entity;

import java.util.Date;

/**
 * 组织
 * 
 * @author HaiTao
 *
 */
public class Org {
	private Long oId;
	// 组织名称
	private String oName;
	// 创建时间
	private Date creatTime;
	// 上级组织ID
	private Long parenteId;
	// 删除标识
	private String delFlag;

	// 是否展开
	private boolean open;

	// 是否选中
	private boolean checked;

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public Long getoId() {
		return oId;
	}

	public void setoId(Long oId) {
		this.oId = oId;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName == null ? null : oName.trim();
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public Long getParenteId() {
		return parenteId;
	}

	public void setParenteId(Long parenteId) {
		this.parenteId = parenteId;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag == null ? null : delFlag.trim();
	}
}