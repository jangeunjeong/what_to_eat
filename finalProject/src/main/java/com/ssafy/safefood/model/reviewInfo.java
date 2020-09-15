package com.ssafy.safefood.model;

public class reviewInfo {
	private int count;
	private int avgScore;

	public reviewInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(int avgScore) {
		this.avgScore = avgScore;
	}

	public reviewInfo(int count, int avgScore) {
		super();
		this.count = count;
		this.avgScore = avgScore;
	}

}
