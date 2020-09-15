package com.ssafy.safefood.model;

public class Searchcnt {
	int code;
	int count;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Searchcnt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Searchcnt(int code, int count) {
		super();
		this.code = code;
		this.count = count;
	}
	@Override
	public String toString() {
		return "Searchcnt [code=" + code + ", count=" + count + "]";
	}
}
