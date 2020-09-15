package com.ssafy.safefood.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.safefood.model.Comment;
import com.ssafy.safefood.model.Notices;
@Mapper
public interface NoticesMapper {

	public List<Notices> getNoticeList();

	public void addnotices(Notices notice);

	public Notices noticedetail(String seq);

	public void update(Notices notice);

	public void delete(String seq);

	public void addcomment(Comment comment);

	public List<Comment> getCommentsList(int seq);

	public void commentdelete(Comment comment);
}
