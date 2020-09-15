package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.mappers.NoticesMapper;
import com.ssafy.safefood.model.Comment;
import com.ssafy.safefood.model.Notices;

@Repository
public class NoticesDaoImpl {

//	String ns = "ssafy.notices.";
	@Autowired
	private SqlSession sqlSession;

	public List<Notices> getNoticeList() {
		return sqlSession.getMapper(NoticesMapper.class).getNoticeList();
	}

	public void addnotices(Notices notice) {
		sqlSession.getMapper(NoticesMapper.class).addnotices(notice);
	}

	public Notices noticedetail(String seq) {
		return sqlSession.getMapper(NoticesMapper.class).noticedetail(seq);
	}

	public void update(Notices notice) {
		sqlSession.getMapper(NoticesMapper.class).update(notice);
	}

	public void delete(String seq) {
		sqlSession.getMapper(NoticesMapper.class).delete(seq);
	}

	public void addcomment(Comment comment) {
		sqlSession.getMapper(NoticesMapper.class).addcomment(comment);
	}

	public List<Comment> getCommentsList(int seq) {
		return sqlSession.getMapper(NoticesMapper.class).getCommentsList(seq);
	}

	public void commentdelete(Comment comment) {
		sqlSession.getMapper(NoticesMapper.class).commentdelete(comment);

	}
}
