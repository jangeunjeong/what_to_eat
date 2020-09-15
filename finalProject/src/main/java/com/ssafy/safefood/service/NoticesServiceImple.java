package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.safefood.dao.NoticesDaoImpl;
import com.ssafy.safefood.model.Comment;
import com.ssafy.safefood.model.Notices;

@Service
public class NoticesServiceImple implements INoticesService {
	@Autowired
	private NoticesDaoImpl noticedao;
	
	@Override
	@Transactional(readOnly=true)
	public List<Notices> getNoticesList() {
		return noticedao.getNoticeList();
	}

	@Override
	public void addnotices(Notices notice) {
		noticedao.addnotices(notice);
	}

	@Override
	public Notices noticedetail(String seq) {
		return noticedao.noticedetail(seq);
	}

	@Override
	public void update(Notices notice) {
		noticedao.update(notice);
	}

	@Override
	public void delete(String seq) {
		noticedao.delete(seq);
	}

	@Override
	public void addcomment(Comment comment) {
		noticedao.addcomment(comment);
	}

	@Override
	public List<Comment> getCommentsList(int seq) {
		return noticedao.getCommentsList(seq);
	}
	
	@Override
	public void commentdelete(Comment comment) {
		noticedao.commentdelete(comment);
		
	}
}
