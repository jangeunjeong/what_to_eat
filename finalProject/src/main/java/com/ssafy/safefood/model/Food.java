package com.ssafy.safefood.model;

public class Food {
	private int code;
	private String name;
	private String maker;
	private String material;
	private String image;
	private int serving;
	private double nutr1;
	private double nutr2;
	private double nutr3;
	private double nutr4;
	private double nutr5;
	private double nutr6;
	private double nutr7;
	private double nutr8;
	private double nutr9;
	private int bgn_year;
	private String foodgroup;
	private int reviews;
	
	

	public int getReviews() {
		return reviews;
	}

	public void setReviews(int reviews) {
		this.reviews = reviews;
	}

	public Food() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Food(int code, String name, String maker, String material, String image) {
		super();
		this.code = code;
		this.name = name;
		this.maker = maker;
		this.material = material;
		this.image = image;
	}

	public Food(int code, String name, String maker, String material, String image, int serving, double nutr1,
			double nutr2, double nutr3, double nutr4, double nutr5, double nutr6, double nutr7, double nutr8,
			double nutr9, int bgn_year) {
		super();
		this.code = code;
		this.name = name;
		this.maker = maker;
		this.material = material;
		this.image = image;
		this.serving = serving;
		this.nutr1 = nutr1;
		this.nutr2 = nutr2;
		this.nutr3 = nutr3;
		this.nutr4 = nutr4;
		this.nutr5 = nutr5;
		this.nutr6 = nutr6;
		this.nutr7 = nutr7;
		this.nutr8 = nutr8;
		this.nutr9 = nutr9;
		this.bgn_year = bgn_year;
	}

	public Food(String name, String maker, int serving, double nutr1, double nutr2, double nutr3, double nutr4,
			double nutr5, double nutr6, double nutr7, double nutr8, double nutr9, int bgn_year) {
		super();
		this.name = name;
		this.maker = maker;
		this.serving = serving;
		this.nutr1 = nutr1;
		this.nutr2 = nutr2;
		this.nutr3 = nutr3;
		this.nutr4 = nutr4;
		this.nutr5 = nutr5;
		this.nutr6 = nutr6;
		this.nutr7 = nutr7;
		this.nutr8 = nutr8;
		this.nutr9 = nutr9;
		this.bgn_year = bgn_year;
	}

	@Override
	public String toString() {
		return "Food [code=" + code + ", name=" + name + ", maker=" + maker + ", material=" + material + ", image="
				+ image + ", serving=" + serving + ", nutr1=" + nutr1 + ", nutr2=" + nutr2 + ", nutr3=" + nutr3
				+ ", nutr4=" + nutr4 + ", nutr5=" + nutr5 + ", nutr6=" + nutr6 + ", nutr7=" + nutr7 + ", nutr8=" + nutr8
				+ ", nutr9=" + nutr9 + ", bgn_year=" + bgn_year + "]";
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getServing() {
		return serving;
	}

	public void setServing(int serving) {
		this.serving = serving;
	}

	public double getNutr1() {
		return nutr1;
	}

	public void setNutr1(double nutr1) {
		this.nutr1 = nutr1;
	}

	public double getNutr2() {
		return nutr2;
	}

	public void setNutr2(double nutr2) {
		this.nutr2 = nutr2;
	}

	public double getNutr3() {
		return nutr3;
	}

	public void setNutr3(double nutr3) {
		this.nutr3 = nutr3;
	}

	public double getNutr4() {
		return nutr4;
	}

	public void setNutr4(double nutr4) {
		this.nutr4 = nutr4;
	}

	public double getNutr5() {
		return nutr5;
	}

	public void setNutr5(double nutr5) {
		this.nutr5 = nutr5;
	}

	public double getNutr6() {
		return nutr6;
	}

	public void setNutr6(double nutr6) {
		this.nutr6 = nutr6;
	}

	public double getNutr7() {
		return nutr7;
	}

	public void setNutr7(double nutr7) {
		this.nutr7 = nutr7;
	}

	public double getNutr8() {
		return nutr8;
	}

	public void setNutr8(double nutr8) {
		this.nutr8 = nutr8;
	}

	public double getNutr9() {
		return nutr9;
	}

	public void setNutr9(double nutr9) {
		this.nutr9 = nutr9;
	}

	public int getBgn_year() {
		return bgn_year;
	}

	public void setBgn_year(int bgn_year) {
		this.bgn_year = bgn_year;
	}

	public String getFoodgroup() {
		return foodgroup;
	}

	public void setFoodgroup(String foodgroup) {
		this.foodgroup = foodgroup;
	}
}
