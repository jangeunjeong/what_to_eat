package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.safefood.dao.QnaDaoImpl;
import com.ssafy.safefood.model.Qna;
import com.ssafy.safefood.model.QnaComment;

@Service
public class QnaServiceImple implements IQnaService {
	@Autowired
	private QnaDaoImpl qnadao;
	
	@Override
	@Transactional(readOnly=true)
	public List<Qna> getQnaList() {
		return qnadao.getQnaList();
	}

	@Override
	public void addqna(Qna qna)  {
		qnadao.addqna(qna);
	}

	@Override
	public Qna qnadetail(int seq) {
		return qnadao.qnadetail(seq);
	}

	@Override
	public void update(Qna qna){
		qnadao.update(qna);
	}

	@Override
	public void delete(int seq) {
		qnadao.delete(seq);
	}

	@Override
	public void addcomment(QnaComment comment) {
		qnadao.addcomment(comment);
	}

	@Override
	public List<QnaComment> getQnaCommentsList(int seq) {
		return qnadao.getCommentsList(seq);
	}
	
	@Override
	public void commentdelete(QnaComment comment) {
		qnadao.commentdelete(comment);
	}
}
