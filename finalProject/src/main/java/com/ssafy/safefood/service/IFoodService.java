package com.ssafy.safefood.service;

import java.util.List;

import com.ssafy.safefood.model.Food;
import com.ssafy.safefood.model.Foodlog;
import com.ssafy.safefood.model.Intake;
import com.ssafy.safefood.model.SearchInfo;
import com.ssafy.safefood.model.Searchcnt;


public interface IFoodService {
	//식품목록 + 페이징
	List<Food> findAllFoods(int number);
	int cntTotFood();
	
	int checkCnt(int code);
	Food searchFoodnutri(int code);
	void addCount(Searchcnt searchcnt);
	public List<Food> findbygroup(String foodgroup);
	List<Food> searchFoodinfo(SearchInfo search);
	void insertCount(int num);
	int isEat(Foodlog foodlog);	
	int selectCnt(int num);
	int CntSearchFoodinfo(SearchInfo info);
	void addNewFood(Foodlog foodlog);
	int checkFoodCount(Foodlog foodlog);
	void addFoodCount(Foodlog foodlog);
	List<Foodlog> findFoodlogs(Intake intake);
	boolean isEattenDay(Intake intake);
	void fooddelete(Foodlog food);
	List<Food> best();
	Foodlog findBest(String id);
	int bestCheck(String id);
	public int count();
	public Food getfood(int tmp);
}
