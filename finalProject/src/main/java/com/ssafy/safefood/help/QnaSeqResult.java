package com.ssafy.safefood.help;

import java.io.Serializable;

public class QnaSeqResult implements Serializable {
	private static final long serialVersionUID = 1L;
	private int seq;
	private String title;
	private String state = "succ";

	public QnaSeqResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaSeqResult(int seq, String title, String state) {
		super();
		this.seq = seq;
		this.title = title;
		this.state = state;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QnaSeqResult [seq=" + seq + ", title=" + title + ", state=" + state + "]";
	}

}