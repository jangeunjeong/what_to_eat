package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.ReviewDaoImpl;
import com.ssafy.safefood.model.Review;
import com.ssafy.safefood.model.pageDto;
import com.ssafy.safefood.model.reviewInfo;

@Service
public class ReviewServiceImple implements IReviewService {
	@Autowired
	private ReviewDaoImpl reviewDao;

	@Override
	public void addReview(Review review) {
		reviewDao.addReview(review);
	}

	@Override
	public void delete(int reviewSeq) {
		reviewDao.delete(reviewSeq);
	}

	@Override
	public List<Review> getReviews(pageDto pd) {
		return reviewDao.getReviews(pd);
	}
	
	@Override
	public int getReviewsCount(int num) {
		return reviewDao.getReviewsCount(num);
	}
	
	@Override
	public reviewInfo getReviewInfo(int code) {
		return reviewDao.getReviewInfo(code) ;
	}
}
