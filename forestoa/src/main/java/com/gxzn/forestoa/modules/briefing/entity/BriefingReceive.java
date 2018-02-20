package com.gxzn.forestoa.modules.briefing.entity;

import java.util.List;
/**
 * 简报收文
 * @author HaiTao
 *
 */
public class BriefingReceive {
	// 收文id
	private Long receiveId;
	// 来文文号
	private String number;
	// 来文单位
	private Long company;
	// 标题
	private String title;
	// pageoffice文件
	private String pofile;
	// 附件(文件)
	private String file;
	// 页数
	private Integer pages;
	// 存档期限(0:10年 1:30年 2:永久存储)
	private String archivalPeriod;
	// 收文日期(创建时间)
	private String createTime;
	// 状态(0:未归档 1:已归档)
	private String receiveStatus;
	// 删除标识(0-未删除 1-已删除)
	private String delFlag;
	private String tasks;
	// 收文任务集合
	private List<BriefingReceiveTask> receiveTasks;

	public Long getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(Long receiveId) {
		this.receiveId = receiveId;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number == null ? null : number.trim();
	}

	public Long getCompany() {
		return company;
	}

	public void setCompany(Long company) {
		this.company = company;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getPofile() {
		return pofile;
	}

	public void setPofile(String pofile) {
		this.pofile = pofile;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file == null ? null : file.trim();
	}


	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public String getArchivalPeriod() {
		return archivalPeriod;
	}

	public void setArchivalPeriod(String archivalPeriod) {
		this.archivalPeriod = archivalPeriod == null ? null : archivalPeriod.trim();
	}
	

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getReceiveStatus() {
		return receiveStatus;
	}

	public void setReceiveStatus(String receiveStatus) {
		this.receiveStatus = receiveStatus == null ? null : receiveStatus.trim();
	}


	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag == null ? null : delFlag.trim();
	}

	public List<BriefingReceiveTask> getReceiveTasks() {
		return receiveTasks;
	}

	public void setReceiveTasks(List<BriefingReceiveTask> receiveTasks) {
		this.receiveTasks = receiveTasks;
	}

	public String getTasks() {
		return tasks;
	}

	public void setTasks(String tasks) {
		this.tasks = tasks;
	}
	
}