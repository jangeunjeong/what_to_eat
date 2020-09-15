package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.model.Member;

public interface IMemberService {

	void regi(Member member);

	Member login(Member member);
	
	int idCheck(Member member);

	int idCheck_PWD(Member member);
	
	Member myself(String id);

	void deleteme(String id);

	void myselfUp(Member member);

	List<Member> findAllMembers();

	int findPW(Member member);
	
	int duplicationCheck(String id);

	 void tmpPw(Member id);
	//boolean isEat(int food_code, String foodmember_id);
}
