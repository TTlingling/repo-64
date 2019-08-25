package com.yc.blog.vo;

/**
 * 结果对象，一般ajax调用，返回结果对象
 * @author tll
 *
 */
public class Result {

	private int code;
	private String msg;
	private Object data;
	
	

	public Result(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}
	public Result(int code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
}
