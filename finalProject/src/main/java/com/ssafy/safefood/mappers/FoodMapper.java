package com.ssafy.safefood.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.safefood.model.Food;
import com.ssafy.safefood.model.Foodlog;
import com.ssafy.safefood.model.Intake;
import com.ssafy.safefood.model.SearchInfo;
import com.ssafy.safefood.model.Searchcnt;

@Mapper
public interface FoodMapper {
	public List<Food> findAllFoods(int number);

	public int cntTotFood();

	public Food searchFoodnutri(int code);

	public int checkCnt(int code);

	public void insertCount(int num);
	
	public void addCount(Searchcnt searchcnt);

	public List<Food> findbygroup(String foodgroup);
	
	public List<Food> searchFoodinfo(SearchInfo search);

	public int isEat(Foodlog foodlog);

	public int selectCnt(int num);
	
	public void addNewFood(Foodlog foodlog);

	public int checkFoodCount(Foodlog foodlog);

	public void addFoodCount(Foodlog foodlog);

	public int CntSearchFoodinfo(SearchInfo info);
	
	public List<Foodlog> findFoodlogs(Intake intake);

	public void fooddelete(Foodlog food);

	public List<Food> best();

	public Foodlog findBest(String id);

	public int bestCheck(String id);
	
	public int isEattenDay(Intake intake);
	
	public int count();

	public Food getfood(int tmp);
}
