package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.model.Qna;
import com.ssafy.safefood.model.QnaComment;
import com.ssafy.safefood.model.reviewInfo;

public interface IQnaService {
	List<Qna> getQnaList();

	void addqna(Qna qna);

	Qna qnadetail(int seq);

	void update(Qna qna);

	void delete(int seq);

	void addcomment(QnaComment comment);

	List<QnaComment> getQnaCommentsList(int seq);

	void commentdelete(QnaComment comment);
	
}
