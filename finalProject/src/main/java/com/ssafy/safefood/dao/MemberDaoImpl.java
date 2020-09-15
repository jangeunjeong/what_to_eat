package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.mappers.MemberMapper;
import com.ssafy.safefood.model.Member;

@Repository
public class MemberDaoImpl {

//	String ns = "ssafy.member.";
	@Autowired
	private SqlSession sqlSession;

	//
	public void regi(Member member) {
		sqlSession.getMapper(MemberMapper.class).regi(member);
	}

	//
	public Member login(Member member) {
		return sqlSession.getMapper(MemberMapper.class).login(member);
	}

	//
	public Member myself(String id) {
		return sqlSession.getMapper(MemberMapper.class).myself(id);
	}

	//
	public int idCheck(Member member) {
		return sqlSession.getMapper(MemberMapper.class).idCheck(member);
	}

	//
	public int idCheck_PWD(Member member) {
		return sqlSession.getMapper(MemberMapper.class).idCheck_PWD(member);
	}

	//
	public void deleteme(String id) {
		sqlSession.getMapper(MemberMapper.class).deleteme(id);
	}

//
	public void myselfUp(Member member) {
		sqlSession.getMapper(MemberMapper.class).myselfUp(member);
	}

//
	public List<Member> findAllMembers() {
		return sqlSession.getMapper(MemberMapper.class).findAllMembers();
	}

//
	public int findPW(Member member) {
		return sqlSession.getMapper(MemberMapper.class).findPW(member);
	}

	public int duplicationCheck(String id) {
		return sqlSession.getMapper(MemberMapper.class).duplicationCheck(id);
	}

	public void tmpPw(Member mem) {
		sqlSession.getMapper(MemberMapper.class).tmpPw(mem);
	};
}
