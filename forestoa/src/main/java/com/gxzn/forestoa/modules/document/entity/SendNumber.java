package com.gxzn.forestoa.modules.document.entity;
/**
 * 发文文号表
 * @author HaiTao
 *
 */
public class SendNumber {
	private Long id;
	// 发文类型
	private String year;
	// 发文类型(0:赤森公发 1:赤森公函发 2:党务 3.其他  4.简报 5.信息)
	private String type;
	// 序号
	private Long node;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year == null ? null : year.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public Long getNode() {
		return node;
	}

	public void setNode(Long node) {
		this.node = node;
	}

}