package com.ssafy.safefood.model;

public class Intake {

	private String id;
	private String date;

	public Intake() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Intake(String id, String date) {
		super();
		this.id = id;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
