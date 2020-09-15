package com.ssafy.safefood.model;

import java.io.Serializable;

public class Member implements Serializable {
	private String id;
	private String pwd;
	private String name;
	private String address;
	private String phone;
	private String allergy;
	private String auth;
	private String gender;
	private String special;
	private int age;
	private int height;
	private int weight;
	private String primaryop;
	private String quiz;
	private String answer;
	
	
	
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getQuiz() {
		return quiz;
	}

	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}

	public String getPrimaryop() {
		return primaryop;
	}

	public void setPrimaryop(String primaryop) {
		this.primaryop = primaryop;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String option) {
		this.special = option;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pwd, String name, String address, String phone, String allergy, String auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.allergy = allergy;
		if (auth.equals("") || auth.equals(null))
			this.auth = "3";
		else {
			this.auth = auth;
		}
	}

	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public Member(String id, String pwd, String auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.auth = auth;

	}



	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", allergy=" + allergy + ", auth=" + auth + ", gender=" + gender + ", special=" + special + ", age="
				+ age + ", height=" + height + ", weight=" + weight + ", primaryop=" + primaryop + ", quiz=" + quiz
				+ ", answer=" + answer + "]";
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
}
