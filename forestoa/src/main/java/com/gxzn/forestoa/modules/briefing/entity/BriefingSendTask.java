package com.gxzn.forestoa.modules.briefing.entity;

import java.util.Date;

/**
 * 简报发文
 * 
 * @author HaiTao
 *
 */
public class BriefingSendTask {
	// 任务id
	private Long taskId;
	// 发文id
	private Long sendId;
	// 开始人员
	private Long startPersonId;
	// 结束人员
	private Long endPersonId;
	// 文件
	private String file;
	// pageoffice文件
	private String pofile;
	// 备注(意见)
	private String remarks;
	// 开始节点
	private Integer startNodeId;
	// 结束节点
	private Integer endNodeId;
	// 开始时间
	private Date startTime;
	// 结束时间
	private Date endTime;
	// Rtx消息状态
	private String rtxMsg;
	//0默认不是，1代表是从别的节点回退回来的任务
	private String isBack;
	//(0:同意 1:不同意)
	private String opinion;
	// 任务状态(0:待办 1:已办)--默认0
	private String taskStatus;
	// 删除标识(0-未删除 1-已删除)--默认0
	private String delFlag;

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public Long getSendId() {
		return sendId;
	}

	public void setSendId(Long sendId) {
		this.sendId = sendId;
	}

	public Long getStartPersonId() {
		return startPersonId;
	}

	public void setStartPersonId(Long startPersonId) {
		this.startPersonId = startPersonId;
	}

	public Long getEndPersonId() {
		return endPersonId;
	}

	public void setEndPersonId(Long endPersonId) {
		this.endPersonId = endPersonId;
	}

	public String getPofile() {
		return pofile;
	}

	public void setPofile(String pofile) {
		this.pofile = pofile == null ? null : pofile.trim();
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks == null ? null : remarks.trim();
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus == null ? null : taskStatus.trim();
	}

	public Integer getStartNodeId() {
		return startNodeId;
	}

	public void setStartNodeId(Integer startNodeId) {
		this.startNodeId = startNodeId;
	}

	public Integer getEndNodeId() {
		return endNodeId;
	}

	public void setEndNodeId(Integer endNodeId) {
		this.endNodeId = endNodeId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag == null ? null : delFlag.trim();
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getIsBack() {
		return isBack;
	}

	public void setIsBack(String isBack) {
		this.isBack = isBack;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getRtxMsg() {
		return rtxMsg;
	}

	public void setRtxMsg(String rtxMsg) {
		this.rtxMsg = rtxMsg;
	}



}