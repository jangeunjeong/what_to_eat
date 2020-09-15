package com.ssafy.safefood.model;

public class Foodlog {
	private int food_code;
	private String foodmember_id;
	private int count;
	private String name;
	private float calorie;
	private float car;
	private float pro;
	private float fat;
	private String date;

	public Foodlog() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getCalorie() {
		return calorie;
	}

	public void setCalorie(float calorie) {
		this.calorie = calorie;
	}

	public Foodlog(String foodmember_id, int food_code) {
		this.foodmember_id = foodmember_id;
		this.food_code = food_code;
	}

	public Foodlog(String foodmember_id, int food_code, String date) {
		this.foodmember_id = foodmember_id;
		this.food_code = food_code;
		this.date = date;
	}

	public Foodlog(int food_code, String foodmember_id, int count) {
		super();
		this.food_code = food_code;
		this.foodmember_id = foodmember_id;
		this.count = count;
	}

	public int getFood_code() {
		return food_code;
	}

	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}

	public String getFoodmember_id() {
		return foodmember_id;
	}

	public void setFoodmember_id(String foodmember_id) {
		this.foodmember_id = foodmember_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public float getCar() {
		return car;
	}

	public void setCar(float car) {
		this.car = car;
	}

	public float getPro() {
		return pro;
	}

	public void setPro(float pro) {
		this.pro = pro;
	}

	public float getFat() {
		return fat;
	}

	public void setFat(float fat) {
		this.fat = fat;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Foodlog [food_code=" + food_code + ", foodmember_id=" + foodmember_id + ", count=" + count + ", name="
				+ name + ", calorie=" + calorie + ", car=" + car + ", pro=" + pro + ", fat=" + fat + ", date=" + date
				+ "]";
	}

}
