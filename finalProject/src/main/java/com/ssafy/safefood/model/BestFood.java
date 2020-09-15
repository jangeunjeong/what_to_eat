package com.ssafy.safefood.model;

public class BestFood {

	private String code;
	private String name;
	private String maker;
	private String image;
	private int count;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public BestFood() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BestFood(String name, String maker, String image, int count) {
		super();
		this.name = name;
		this.maker = maker;
		this.image = image;
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BestFood [name=" + name + ", maker=" + maker + ", image=" + image + ", count=" + count + "]";
	}
	
	
}
