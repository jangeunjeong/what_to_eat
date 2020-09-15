package com.ssafy.safefood.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.safefood.model.Review;
import com.ssafy.safefood.model.pageDto;
import com.ssafy.safefood.model.reviewInfo;

@Mapper
public interface ReviewMapper {
	public void addReview(Review review);
	
	public List<Review> getReviews(pageDto pd);
	
	public void delete(int reviewSeq);
	
	public int getReviewsCount(int code);
	
	public reviewInfo getReviewInfo(int code);
}