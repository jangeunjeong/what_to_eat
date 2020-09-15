package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.model.Review;
import com.ssafy.safefood.model.pageDto;
import com.ssafy.safefood.model.reviewInfo;

public interface IReviewService {

	public void addReview(Review review);

	public List<Review> getReviews(pageDto pd);

	public int getReviewsCount(int num);
	
	public void delete(int reviewSeq);
	
	public reviewInfo getReviewInfo(int code);
}
