package com.ssafy.safefood.model;

public class QnaComment {

	private int seq;
	private String writer;
	private String content;
	private int qna_seq;

	public QnaComment() {
		super();
	}

	public QnaComment(int seq, String writer, String content, int qna_seq) {
		this.seq = seq;
		this.writer = writer;
		this.content = content;
		this.qna_seq = qna_seq;
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

	public int getqna_seq() {
		return qna_seq;
	}

	public void setqna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	@Override
	public String toString() {
		return "Comment [seq=" + seq + ", writer=" + writer + ", content=" + content + ", qna_seq=" + qna_seq
				+ "]";
	}

}
