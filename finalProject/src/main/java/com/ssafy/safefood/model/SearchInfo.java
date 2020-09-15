package com.ssafy.safefood.model;

public class SearchInfo {

	private String keyword, type;
	private int page;
	
	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public SearchInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SearchInfo(String keyword, String type) {
		super();
		this.keyword = keyword;
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "SearchInfo [keyword=" + keyword + ", type=" + type + "]";
	}

}
