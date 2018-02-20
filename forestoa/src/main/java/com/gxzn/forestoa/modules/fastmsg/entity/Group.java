package com.gxzn.forestoa.modules.fastmsg.entity;

/**
 * 工作组
 * 
 * @author jiabo
 *
 */
public class Group {

	// 工作组ID
	private int workgroupid;
	// 群组类型 0: 临时群组; 1: 普通群组
	private int grouptype = 0;
	// 群组名称 非空
	private String groupname;
	// 群介绍
	private String introduction;
	// 加群设置0: 允许加入; 1: 需要验证; 2: 不允许加入
	private int joinsetting = 1;
	// 创建者(用户ID/用户名) 非空
	private String creator;
	// 群成员ID(格式:1,2,3...)
	private String members;

	public int getWorkgroupid() {
		return workgroupid;
	}

	public void setWorkgroupid(int workgroupid) {
		this.workgroupid = workgroupid;
	}

	public int getGrouptype() {
		return grouptype;
	}

	public void setGrouptype(int grouptype) {
		this.grouptype = grouptype;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getJoinsetting() {
		return joinsetting;
	}

	public void setJoinsetting(int joinsetting) {
		this.joinsetting = joinsetting;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getMembers() {
		return members;
	}

	public void setMembers(String members) {
		this.members = members;
	}

}
