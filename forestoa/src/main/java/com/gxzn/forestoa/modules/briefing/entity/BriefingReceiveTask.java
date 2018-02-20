package com.gxzn.forestoa.modules.briefing.entity;

import java.util.Date;

/**
 * 简报收文任务
 * 
 * @author HaiTao
 *
 */
public class BriefingReceiveTask {
	// 收文任务id
	private Long taskId;
	// 收文ID
	private Long receiveId;
	// 开始人员(关联人员ID)
	private Long startPersonId;
	// 结束人员(关联人员ID)
	private Long endPersonId;
	// 开始节点
	private Integer startNodeId;
	// 结束节点
	private Integer endNodeId;
	// 开始时间
	private Date startTime;
	// 结束时间
	private Date endTime;
	// 备注
	private String remarks;
	// Rtx消息状态
	private String rtxMsg;
	//(0:同意 1:不同意)
	private String opinion;
	// 任务状态(0:待办 1:已办 2:退回)
	private String taskStatus;
	// 删除标识(0-未删除 1-已删除)--默认0
	private String delFlag;
	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public Long getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(Long receiveId) {
		this.receiveId = receiveId;
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

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus == null ? null : taskStatus.trim();
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks == null ? null : remarks.trim();
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getRtxMsg() {
		return rtxMsg;
	}

	public void setRtxMsg(String rtxMsg) {
		this.rtxMsg = rtxMsg;
	}

}