package com.gxzn.forestoa.common.util;
/**
 * 接口统一返回值
 * @author G8670
 *
 * @param <T>
 */
public class ResponseModel<T> {

	private String msg = "失败";
	private boolean success = false;
	private T data;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void init(String msg) {
		this.msg = msg;
		this.success = false;
		this.data = null;
	}

	public void success(String msg,T data) {
		this.msg = msg;
		this.success = true;
		this.data = data;
	}
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
