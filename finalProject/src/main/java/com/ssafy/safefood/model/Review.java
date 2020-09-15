package com.ssafy.safefood.model;

public class Review {

	private int review_seq;
	private int food_code;
	private String writer;
	private String contents;
	private int score;
	private String wdate;
	private String food_name;

	public Review() {
		super();
		// TODO Auto-generated constructor stub

	}


	@Override
	public String toString() {
		return "Review [review_seq=" + review_seq + ", food_code=" + food_code + ", writer=" + writer + ", contents="
				+ contents + ", score=" + score + ", wdate=" + wdate + ", food_name=" + food_name + "]";
	}


	public int getReview_seq() {
		return review_seq;
	}


	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}


	public Review(int food_code, String writer, String contents, int score) {
		super();
		this.food_code = food_code;
		this.writer = writer;
		this.contents = contents;
		this.score = score;
	}


	public int getFood_code() {
		return food_code;
	}

	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
}
