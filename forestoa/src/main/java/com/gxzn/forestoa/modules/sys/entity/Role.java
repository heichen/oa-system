package com.gxzn.forestoa.modules.sys.entity;

import java.util.Date;
import java.util.List;

import com.gxzn.ares.framework.mybatis.pagehelper.PageInfo;
/**
 * 角色
 * @author jiabo
 *
 */
public class Role extends PageInfo<Role> {
	//角色Id
	private Long rId;

	//角色名称
	private String rName;

	//创建时间
	private Date createTime;

	//删除标识0未删除，1已删除
	private String delFlag;

	//备注
	private String remarks;

	// 菜单列表
	private List<Menu> menus;


	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public Long getrId() {
		return rId;
	}

	public void setrId(Long rId) {
		this.rId = rId;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName == null ? null : rName.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag == null ? null : delFlag.trim();
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks == null ? null : remarks.trim();
	}
}