package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.model.Comment;
import com.ssafy.safefood.model.Notices;

public interface INoticesService {
	List<Notices> getNoticesList();

	void addnotices(Notices notice);

	Notices noticedetail(String seq);

	void update(Notices notice);

	void delete(String seq);

	void addcomment(Comment comment);

	List<Comment> getCommentsList(int seq);

	void commentdelete(Comment comment);
}
