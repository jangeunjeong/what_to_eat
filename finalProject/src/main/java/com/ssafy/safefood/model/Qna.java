package com.ssafy.safefood.model;

public class Qna {
	private int seq;
	private String writer;
	private String title;
	private String wdate;
	private String contents;
	private String pw;
	private String category;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Qna(int seq, String writer, String title, String wdate, String contents, String pw) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.wdate = wdate;
		this.contents = contents;
		this.pw = pw;
	}
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "Qna [seq=" + seq + ", writer=" + writer + ", title=" + title + ", wdate=" + wdate + ", contents="
				+ contents + ", pw=" + pw + "]";
	}

	
}
