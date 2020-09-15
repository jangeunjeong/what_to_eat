package com.ssafy.safefood.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.safefood.model.Member;
@Mapper
public interface MemberMapper {
	public void regi(Member member);

	public Member login(Member member);

	public Member myself(String id);

	public int idCheck(Member member);

	public int idCheck_PWD(Member member);

	public void deleteme(String id);

	public void myselfUp(Member member);

	public List<Member> findAllMembers();

	public int findPW(Member member);
	
	public int duplicationCheck(String id);
	
	public void tmpPw(Member mem);
}
