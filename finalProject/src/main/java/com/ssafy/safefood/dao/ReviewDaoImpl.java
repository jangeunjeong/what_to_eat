package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.mappers.ReviewMapper;
import com.ssafy.safefood.model.Review;
import com.ssafy.safefood.model.pageDto;
import com.ssafy.safefood.model.reviewInfo;

@Repository
public class ReviewDaoImpl {

	@Autowired
	private SqlSession sqlSession;

	public void addReview(Review review) {
		sqlSession.getMapper(ReviewMapper.class).addReview(review);
	};
	
	public List<Review> getReviews(pageDto pd){
		return sqlSession.getMapper(ReviewMapper.class).getReviews(pd);
	};
	
	public int getReviewsCount(int num){
		return sqlSession.getMapper(ReviewMapper.class).getReviewsCount(num);
	};
	
	public void delete(int reviewSeq) {
		sqlSession.getMapper(ReviewMapper.class).delete(reviewSeq);
	};
	
	public reviewInfo getReviewInfo(int code) {
		return sqlSession.getMapper(ReviewMapper.class).getReviewInfo(code);
	}
}
