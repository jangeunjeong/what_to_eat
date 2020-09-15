package com.ssafy.safefood.model;

public class Notices {
	private int seq;
	private String writer;
	private String title;
	private String wdate;
	private String wcontents;
	
	public Notices(int seq, String writer, String title, String wdate, String wcontents) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.wdate = wdate;
		this.wcontents = wcontents;
	}
	public Notices() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getWcontents() {
		return wcontents;
	}
	public void setWcontents(String wcontents) {
		this.wcontents = wcontents;
	}
	@Override
	public String toString() {
		return "Notices [seq=" + seq + ", writer=" + writer + ", title=" + title + ", wdate=" + wdate + ", wcontents="
				+ wcontents + "]";
	}
	
}
