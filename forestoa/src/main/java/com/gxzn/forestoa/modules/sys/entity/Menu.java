package com.gxzn.forestoa.modules.sys.entity;

import java.util.Date;
import java.util.List;
/**
 * 菜单
 * @author jiabo
 *
 */
public class Menu {
	private Long mId;

	private String mName;

	private String mUrl;

	private Date createTime;

	private Long parenteId;

	private String delFlag;

	// 菜单级别 1 
	private int mLeave;

	// 排序
	private int sort;

	// 子集菜单集合
	private List<Menu> childMenus;

	// 角色Id
	private Long rId;

	// 角色与菜单直接的绑定id
	private String rmId;

	// 是否关联0未关联，1关联
	private int binDing;

	public int getmLeave() {
		return mLeave;
	}

	public void setmLeave(int mLeave) {
		this.mLeave = mLeave;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public Long getrId() {
		return rId;
	}

	public void setrId(Long rId) {
		this.rId = rId;
	}

	public int getBinDing() {
		return binDing;
	}

	public void setBinDing(int binDing) {
		this.binDing = binDing;
	}

	public String getRmId() {
		return rmId;
	}

	public void setRmId(String rmId) {
		this.rmId = rmId;
	}

	public List<Menu> getChildMenus() {
		return childMenus;
	}

	public void setChildMenus(List<Menu> childMenus) {
		this.childMenus = childMenus;
	}

	public Long getmId() {
		return mId;
	}

	public void setmId(Long mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmUrl() {
		return mUrl;
	}

	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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