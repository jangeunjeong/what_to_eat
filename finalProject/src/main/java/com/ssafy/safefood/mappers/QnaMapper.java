package com.ssafy.safefood.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.safefood.model.Qna;
import com.ssafy.safefood.model.QnaComment;

@Mapper
public interface QnaMapper {
	public List<Qna> getQnaList();

	public void addqna(Qna qna);

	public Qna qnadetail(int seq);

	public void update(Qna qna);

	public void delete(int seq);

	public void addcomment(QnaComment comment);

	public List<QnaComment> getCommentsList(int seq);

	public void commentdelete(QnaComment comment);
}
