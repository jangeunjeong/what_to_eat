package com.ssafy.safefood.model;

public class Comment {

	private int seq;
	private String writer;
	private String content;
	private int notice_seq;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int seq, String writer, String content, int notice_seq) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.content = content;
		this.notice_seq = notice_seq;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}

	@Override
	public String toString() {
		return "Comment [seq=" + seq + ", writer=" + writer + ", content=" + content + ", notice_seq=" + notice_seq
				+ "]";
	}

}
