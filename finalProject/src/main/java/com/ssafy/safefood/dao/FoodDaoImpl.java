package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.mappers.FoodMapper;
import com.ssafy.safefood.model.Food;
import com.ssafy.safefood.model.Foodlog;
import com.ssafy.safefood.model.Intake;
import com.ssafy.safefood.model.SearchInfo;
import com.ssafy.safefood.model.Searchcnt;

@Repository
public class FoodDaoImpl {
	@Autowired
	private SqlSession sqlSession;

	public List<Food> findAllFoods(int number) {
		return sqlSession.getMapper(FoodMapper.class).findAllFoods(number);
	}

	public List<Food> findbygroup(String foodgroup) {
		return sqlSession.getMapper(FoodMapper.class).findbygroup(foodgroup);
	}

	
	public int cntTotFood() {
		return sqlSession.getMapper(FoodMapper.class).cntTotFood();
	}

	public Food searchFoodnutri(int code) {
		return sqlSession.getMapper(FoodMapper.class).searchFoodnutri(code);
	}

	public int checkCnt(int code) {
		return sqlSession.getMapper(FoodMapper.class).checkCnt(code);
	}

	public void insertCount(int num) {
		sqlSession.getMapper(FoodMapper.class).insertCount(num);
	}
	
	public int CntSearchFoodinfo(SearchInfo info) {
		return sqlSession.getMapper(FoodMapper.class).CntSearchFoodinfo(info);
	}
	
	public int selectCnt(int num) {
		return sqlSession.getMapper(FoodMapper.class).selectCnt(num);
	}
	
	public void addCount(Searchcnt searchcnt) {
		sqlSession.getMapper(FoodMapper.class).addCount(searchcnt);
	}

	public List<Food> searchFoodinfo(SearchInfo search) {
		return sqlSession.getMapper(FoodMapper.class).searchFoodinfo(search);
	}

	public int isEat(Foodlog foodlog) {
		return sqlSession.getMapper(FoodMapper.class).isEat(foodlog);
	}

	public void addNewFood(Foodlog foodlog) { // 새로운 음식 섭취시
		sqlSession.getMapper(FoodMapper.class).addNewFood(foodlog);
	}

	public int checkFoodCount(Foodlog foodlog) {
		return sqlSession.getMapper(FoodMapper.class).checkFoodCount(foodlog);
	}

	public void addFoodCount(Foodlog foodlog) {
		sqlSession.getMapper(FoodMapper.class).addFoodCount(foodlog);
	}

	public List<Foodlog> findFoodlogs(Intake intake) {
		return sqlSession.getMapper(FoodMapper.class).findFoodlogs(intake);
	}

	public boolean isEattenDay(Intake intake) {
		int result = sqlSession.getMapper(FoodMapper.class).isEattenDay(intake);
		return result>0? true : false;
	}
	
	public void fooddelete(Foodlog food) {
		sqlSession.getMapper(FoodMapper.class).fooddelete(food);

	}

	public List<Food> best() {
		return sqlSession.getMapper(FoodMapper.class).best();
	}

	public Foodlog findBest(String id) {
		return sqlSession.getMapper(FoodMapper.class).findBest(id);
	}

	public int bestCheck(String id) {
		return sqlSession.getMapper(FoodMapper.class).bestCheck(id);
	}
	
	public int count() {
		return sqlSession.getMapper(FoodMapper.class).count();
	}

	public Food getfood(int tmp) {
		return sqlSession.getMapper(FoodMapper.class).getfood(tmp);
	}
}
