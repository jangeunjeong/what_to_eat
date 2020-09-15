package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.MemberDaoImpl;
import com.ssafy.safefood.model.Member;

@Service
public class MemberServiceImpl implements IMemberService {
	@Autowired
	private MemberDaoImpl memberdao;

	@Override
	public void regi(Member member) {
		memberdao.regi(member);
	}

	@Override
	public Member login(Member member) {
		return memberdao.login(member);
	}

	@Override
	public Member myself(String id) {
		return memberdao.myself(id);
	}

	@Override
	public void deleteme(String id) {
		memberdao.deleteme(id);
	}

	@Override
	public void myselfUp(Member member) {
		memberdao.myselfUp(member);
	}
	//
	@Override
	public List<Member> findAllMembers() {
		return memberdao.findAllMembers();
	}

	@Override
	public int findPW(Member member) {
		return memberdao.findPW(member);
	}
	
	@Override
	public void tmpPw(Member mem) {
		memberdao.tmpPw(mem);
	}

	@Override
	public int idCheck(Member member) {
		return memberdao.idCheck(member);
	}
	
	@Override
	public int idCheck_PWD(Member member) {
		return memberdao.idCheck_PWD(member);
	}

	@Override
	public int duplicationCheck(String id) {
		return memberdao.duplicationCheck(id);
	}
//	@Override
//	public boolean isEat(int food_code, String foodmember_id) {
//		if (memberdao.isEat(food_code, foodmember_id) == false)
//			return false;
//		else
//			return true;
//		return false;
//	}

}
