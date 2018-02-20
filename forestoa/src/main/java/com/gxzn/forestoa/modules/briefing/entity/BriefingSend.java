package com.gxzn.forestoa.modules.briefing.entity;


/**
 * 简报发文
 * 
 * @author HaiTao
 *
 */
public class BriefingSend {
	// 发文id
	private Long sendId;
	// 发文文号
	private Long number;
	// 主办科室
	private Long hostDepartment;
	// 标题
	private String title;
	// 存档期限
	private String archivalPeriod;
	// 打印纸质份数
	private Integer copies;
	// 页数
	private Integer pages;
	// 发文类型(0:简报 1:信息 )
	private String type;
	// 发文日期
	private String createTime;
	// 主送单位
	private Long mainCompany;
	// 抄送单位
	private String copyCompany;
	//预投栏目
	private String preCastColumn;
	// 状态(0:未归档 1:已归档)--默认0
	private String sendStatus;
	// 删除标识(0-未删除 1-已删除)--默认0
	private String delFlag;
	//发文任务
	private String tasks;

	public Long getSendId() {
		return sendId;
	}

	public void setSendId(Long sendId) {
		this.sendId = sendId;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public Long getHostDepartment() {
		return hostDepartment;
	}

	public void setHostDepartment(Long hostDepartment) {
		this.hostDepartment = hostDepartment;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getArchivalPeriod() {
		return archivalPeriod;
	}

	public void setArchivalPeriod(String archivalPeriod) {
		this.archivalPeriod = archivalPeriod == null ? null : archivalPeriod.trim();
	}

	public Integer getCopies() {
		return copies;
	}

	public void setCopies(Integer copies) {
		this.copies = copies;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}


	public Long getMainCompany() {
		return mainCompany;
	}

	public void setMainCompany(Long mainCompany) {
		this.mainCompany = mainCompany;
	}

	public String getCopyCompany() {
		return copyCompany;
	}

	public void setCopyCompany(String copyCompany) {
		this.copyCompany = copyCompany;
	}

	public String getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus == null ? null : sendStatus.trim();
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag == null ? null : delFlag.trim();
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getTasks() {
		return tasks;
	}

	public void setTasks(String tasks) {
		this.tasks = tasks;
	}

	public String getPreCastColumn() {
		return preCastColumn;
	}

	public void setPreCastColumn(String preCastColumn) {
		this.preCastColumn = preCastColumn;
	}



}