package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.mappers.QnaMapper;
import com.ssafy.safefood.model.Qna;
import com.ssafy.safefood.model.QnaComment;

@Repository
public class QnaDaoImpl {

//	String ns = "ssafy.qna.";
	@Autowired
	private SqlSession sqlSession;

//
	public List<Qna> getQnaList() {
		return sqlSession.getMapper(QnaMapper.class).getQnaList();
		// return sqlSession.selectList(ns+"getQnaList");
	}

	public void addqna(Qna qna) {
		sqlSession.getMapper(QnaMapper.class).addqna(qna);
		// return sqlSession.insert(ns + "addqna", qna);
	}

	public Qna qnadetail(int seq) {
		return sqlSession.getMapper(QnaMapper.class).qnadetail(seq);
		// return sqlSession.selectOne(ns + "qnadetail", seq);
	}

	public void update(Qna qna) {
		sqlSession.getMapper(QnaMapper.class).update(qna);
		// sqlSession.update(ns + "update", qna);
	}

	public void delete(int seq) {
		sqlSession.getMapper(QnaMapper.class).delete(seq);
		// sqlSession.update(ns + "delete", seq);
	}

	public void addcomment(QnaComment comment) {
		sqlSession.getMapper(QnaMapper.class).addcomment(comment);
		// sqlSession.insert(ns + "addcomment", comment);
	}

	public List<QnaComment> getCommentsList(int seq) {
		return sqlSession.getMapper(QnaMapper.class).getCommentsList(seq);
		// return sqlSession.selectList(ns + "getCommentsList", seq);
	}

	public void commentdelete(QnaComment comment) {
		sqlSession.getMapper(QnaMapper.class).commentdelete(comment);
		// sqlSession.delete(ns+"commentdelete",comment);
	}
}
