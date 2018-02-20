package com.gxzn.forestoa.modules.fastmsg.entity;

/**
 * fastmsg 发送消息
 * @author jiabo
 *
 */
public class Msg {

	// 发送者(用户ID/用户名)
	private String sender;
	// 接收者(用户ID/用户名)
	private String receiver;
	// 内容
	private String content;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
