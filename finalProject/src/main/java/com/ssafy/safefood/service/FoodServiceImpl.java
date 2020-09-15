package com.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.safefood.dao.FoodDaoImpl;
import com.ssafy.safefood.model.Food;
import com.ssafy.safefood.model.Foodlog;
import com.ssafy.safefood.model.Intake;
import com.ssafy.safefood.model.SearchInfo;
import com.ssafy.safefood.model.Searchcnt;

@Service
public class FoodServiceImpl implements IFoodService {

	@Autowired
	private FoodDaoImpl fooddao;

	@Override
	public List<Food> findAllFoods(int number) {
		return fooddao.findAllFoods(number);
	}
	
	@Override
	public List<Food> findbygroup(String foodgroup) {
		return fooddao.findbygroup(foodgroup);
	}

	@Override
	public int selectCnt(int num) {
		return fooddao.selectCnt(num);
	}
	
	@Override
	public int CntSearchFoodinfo(SearchInfo info) {
		return fooddao.CntSearchFoodinfo(info);
	}
	
	@Override
	public int cntTotFood() {
		return fooddao.cntTotFood();
	}

	@Override
	public void insertCount(int num) {
		fooddao.insertCount(num);
	}
	
	@Override
	public Food searchFoodnutri(int code) {
		return fooddao.searchFoodnutri(code);
	}

	@Override
	public int checkCnt(int code) {
		return fooddao.checkCnt(code);
	}

	@Override
	public void addCount(Searchcnt searchcnt) {
		fooddao.addCount(searchcnt);
	}

	@Override
	public List<Food> searchFoodinfo(SearchInfo search) {
		return fooddao.searchFoodinfo(search);
	}

	@Override
	public int isEat(Foodlog foodlog) {
		return fooddao.isEat(foodlog);
	}

	@Override
	public void addNewFood(Foodlog foodlog) {
		fooddao.addNewFood(foodlog);
	}

	@Override
	public int checkFoodCount(Foodlog foodlog) {
		return fooddao.checkFoodCount(foodlog);
	}

	@Override
	public void addFoodCount(Foodlog foodlog) {
		fooddao.addFoodCount(foodlog);
	}

	@Override
	public List<Foodlog> findFoodlogs(Intake intake) {
		return fooddao.findFoodlogs(intake);
	}

	@Override
	public boolean isEattenDay(Intake intake) {
		return fooddao.isEattenDay(intake);
	}
	
	@Override
	public void fooddelete(Foodlog food) {
		fooddao.fooddelete(food);
	}

	@Override
	public List<Food> best() {
		return fooddao.best();
	}

	@Override
	public Foodlog findBest(String id) {
		return fooddao.findBest(id);
	}
	
	@Override
	public int bestCheck(String id) {
		return fooddao.bestCheck(id);
	}
	
	@Override
	public int count() {
		return fooddao.count();
	}
	@Override
	public Food getfood(int tmp) {
		return fooddao.getfood(tmp);
	}
}
