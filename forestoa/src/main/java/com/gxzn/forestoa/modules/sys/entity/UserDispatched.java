package com.gxzn.forestoa.modules.sys.entity;

/**
 * 人员委派
 * 
 * @author jiabo
 *
 */
public class UserDispatched {

	private Long udId; // 主键id

	private Long assignedUid;// 委派人id

	private Long acceptUid;// 接收人id

	private String startTime;// 开始时间

	private String endTime;// 结束时间

	private int valid;// 是否有效。默认0无效

	public Long getUdId() {
		return udId;
	}

	public void setUdId(Long udId) {
		this.udId = udId;
	}

	public Long getAssignedUid() {
		return assignedUid;
	}

	public void setAssignedUid(Long assignedUid) {
		this.assignedUid = assignedUid;
	}

	public Long getAcceptUid() {
		return acceptUid;
	}

	public void setAcceptUid(Long acceptUid) {
		this.acceptUid = acceptUid;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getValid() {
		return valid;
	}

	public void setValid(int valid) {
		this.valid = valid;
	}

}
