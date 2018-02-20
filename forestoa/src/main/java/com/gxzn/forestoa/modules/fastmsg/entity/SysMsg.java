package com.gxzn.forestoa.modules.fastmsg.entity;

public class SysMsg {

	private Long workgroupid;// 工作组ID,默认为0
	private String title;// 标题,非空
	private String category;// 分类,非空
	private String content;// 内容,非空
	private String link;// 网页链接
	private int forusertype=1;// 指定用户类型,-1: 全部用户, 0: 外部用户, 1: 内部用户(当等于1时，receivers才有效)
	private int foronlineusers;// 只发送给在线用户,0: false, 1: true
	private String receivers;// 发送给指定用户或部门(格式:user_1,user_2,depart_1,depart_2)  user_用户id,depart_部门id
	private int needreaded;// 允许阅读计数,0: false, 1: true
	private int needfeedback;// 允许消息反馈(暂不使用),0: false, 1: true

	public Long getWorkgroupid() {
		return workgroupid;
	}

	public void setWorkgroupid(Long workgroupid) {
		this.workgroupid = workgroupid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getForusertype() {
		return forusertype;
	}

	public void setForusertype(int forusertype) {
		this.forusertype = forusertype;
	}

	public int getForonlineusers() {
		return foronlineusers;
	}

	public void setForonlineusers(int foronlineusers) {
		this.foronlineusers = foronlineusers;
	}

	public String getReceivers() {
		return receivers;
	}

	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}

	public int getNeedreaded() {
		return needreaded;
	}

	public void setNeedreaded(int needreaded) {
		this.needreaded = needreaded;
	}

	public int getNeedfeedback() {
		return needfeedback;
	}

	public void setNeedfeedback(int needfeedback) {
		this.needfeedback = needfeedback;
	}

}
