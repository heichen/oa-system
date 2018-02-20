package com.gxzn.forestoa.modules.sys.entity;

/**
 * 组织人员数
 * 
 * @author jiabo
 *
 */
public class ZTree {

	private Long nodeId;// 节点id

	private String nodeName;// 节点名称

	private String nodeValue;// 节点内容

	private Long pId;// 父节点id

	private boolean open = true;// 默认展开

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public Long getNodeId() {
		return nodeId;
	}

	public void setNodeId(Long nodeId) {
		this.nodeId = nodeId;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getNodeValue() {
		return nodeValue;
	}

	public void setNodeValue(String nodeValue) {
		this.nodeValue = nodeValue;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

}
