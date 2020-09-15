package com.ssafy.safefood.model;

public class pageDto {
	private int code;
	private int number;

	public pageDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public pageDto(int code, int number) {
		super();
		this.code = code;
		this.number = number;
	}

}
