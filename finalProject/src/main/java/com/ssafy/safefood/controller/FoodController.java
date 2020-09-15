package com.ssafy.safefood.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.safefood.model.Food;
import com.ssafy.safefood.model.Foodlog;
import com.ssafy.safefood.model.Member;
import com.ssafy.safefood.model.Review;
import com.ssafy.safefood.model.SearchInfo;
import com.ssafy.safefood.model.Searchcnt;
import com.ssafy.safefood.model.pageDto;
import com.ssafy.safefood.model.reviewInfo;
import com.ssafy.safefood.service.IFoodService;
import com.ssafy.safefood.service.IMemberService;
import com.ssafy.safefood.service.IReviewService;

@Controller
public class FoodController {

	@Autowired
	private IFoodService service;

	@Autowired
	private IMemberService mservice;

	@Autowired
	private IReviewService rservice;
	
	@RequestMapping(value = "life.do", method = RequestMethod.GET)
	public String life(Model model) {
		return "life";
	}
	@RequestMapping(value = "lifedetail.do", method = RequestMethod.GET)
	public String lifedetail(String foodgroup, Model model) {
		System.out.println(foodgroup);
		List<Food> foods=new LinkedList<>();
		foods=service.findbygroup(foodgroup);
		int size=foods.size();
		//1부터 size중 5개를 랜덤하게 골라보자
		List<Food> buff=new LinkedList<>();
		int[] cnt=new int[size];
		boolean[] check=new boolean[size];
		
		for (int i = 0; i < size; i++) {
			cnt[i]=foods.get(i).getCode();
		}
		int i=0;
		while(i<5) {
			int tmp=(int)(Math.random()*size);
			System.out.println("tmp: "+tmp);
			if(!check[tmp]) {
				check[tmp]=true;
				buff.add(service.getfood(cnt[tmp]));
				i++;
			}
		}
		model.addAttribute("foods",buff);
		for (int j = 0; j < buff.size(); j++) {
			System.out.print(buff.get(j).getCode()+" ");
		}
		return "lifedetail";
	}
	
	
	@RequestMapping(value = "buffet.do", method = RequestMethod.GET)
	public String buffet(Model model) {
		System.out.println("36뷔페를 시작해보자");
		int count=service.count();	//전체 데이터 개수
		List<Food> buff=new LinkedList<>();
		boolean[] cnt=new boolean[count+1];
		int i=0;
		while(i<36) {
			int tmp=(int)(Math.random()*count)+1;
			if(!cnt[tmp]) {
				cnt[tmp]=true;
				buff.add(service.getfood(tmp));
				i++;
			}
		}
		for (int j = 0; j < buff.size(); j++) {
			System.out.print(buff.get(j).getCode()+" ");
		}
		model.addAttribute("buffet",buff);
		return "buffet";
	}

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String findAllFoods(Model model, String recentPage) {
		int recentPage2 = 1;
		int totPage = (int) Math.ceil(service.cntTotFood() / 5);

		if (recentPage != null && recentPage != "") {
			recentPage2 = Integer.parseInt(recentPage);
		}

		List<Food> foods = service.findAllFoods((recentPage2 - 1) * 5);
		model.addAttribute("foods", foods);
		model.addAttribute("totPage", totPage);

		return "foodSearchForm";
	}

	@RequestMapping(value = "foodDetail.do", method = RequestMethod.GET)
	public String foodDetail(HttpServletRequest req, Model model, int code, String recentPage) {
		System.out.println(code);
		Food f = service.searchFoodnutri(code);
		System.out.println(f.toString());
		int cnt = service.checkCnt(f.getCode());
		System.out.println(cnt);
		Searchcnt log = new Searchcnt(f.getCode(), cnt);
		System.out.println(log.toString());
		service.addCount(log);
		model.addAttribute("count", cnt + 1);
		String[] allergys = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
				"계란흰자" };
		String[] prag = {"율무","팥","감,","감 ","감)","카페인","커피","석류 ", "파인애플","계피","호프","홉"};
		String[] material = f.getMaterial().split(",");
		String tmp = ""; // 유해성분
		TreeSet<String> set = new TreeSet<>();
		
		String alert ="";
		TreeSet<String> set2 = new TreeSet<>();
		
		
		for (int i = 0; i <prag.length; i++) {
			for (int j = 0; j < material.length; j++) {
				if (material[j].contains(allergys[i])) {
					set.add(allergys[i]);
				}
				if (material[j].contains(prag[i])) {
					System.out.println("prag에 추가될 것: "+material[j]);
					set2.add(prag[i]);
				}
			}
		}
		
		for (int i = 0; i < set2.size(); i++) {
			alert += set2.pollFirst() + ",";
		}
		if (alert.length() > 0)
			alert = alert.substring(0, alert.length() - 1);
		
		model.addAttribute("f", f);
		HttpSession session = req.getSession();
		
		String mytmp = "";
		String id = ((Member) session.getAttribute("login")).getId();
		String user = ((Member) session.getAttribute("login")).getPrimaryop();
		System.out.println("너의 신분은 "+user);
		Member myself = mservice.myself(id);
		if (myself.getAllergy() == null || myself.getAllergy().equals(' ')) {
		} else {
			String[] myAllergy = myself.getAllergy().split(",");
			for (int i = 0; i < myAllergy.length; i++) {
				if (set.contains(myAllergy[i])) {
					mytmp += myAllergy[i] + ",";
				}
			}
			if (mytmp.length() > 0)
				mytmp = mytmp.substring(0, mytmp.length() - 1);
		}
		if (mytmp.equals("")) {
			mytmp += "알레르기 성분 없음";
		}
		req.setAttribute("myallergy", mytmp);
		int size = set.size();
		for (int i = 0; i < size; i++) {
			tmp += set.pollFirst() + ",";
		}
		if (tmp.length() > 0)
			tmp = tmp.substring(0, tmp.length() - 1);
		if (tmp.equals("")) {
			tmp += "유해 성분 없음";
		}
		model.addAttribute("hazard", tmp);
		model.addAttribute("user",user);
		model.addAttribute("len",alert.length());
		model.addAttribute("prag",alert);
		// 리뷰 부분 // 
		int recentPage2 = 1;

		if (recentPage != null && recentPage != "") {
			recentPage2 = Integer.parseInt(recentPage);
		}

		
		List<Review> reviewList = new ArrayList<>();
		reviewList = rservice.getReviews(new pageDto(f.getCode(), (recentPage2 - 1) * 5));
		int totPage=1;
		int reviewSize = rservice.getReviewsCount(code);
		if(reviewList!=null)
			totPage = (int) Math.ceil(reviewSize / 5)+1;

		model.addAttribute("totPage", totPage);
		model.addAttribute("reviews", reviewList);
		for(Review  r: reviewList)
			System.out.println(r);
		
		reviewInfo info = null;
		info = rservice.getReviewInfo(code);
		if(info == null) {
			info = new reviewInfo(0,0);
		}
		model.addAttribute("reviewInfo", info);
		
		return "foodDetail";
	}

	@RequestMapping(value = "find.do", method = RequestMethod.POST)
	public String find(Model model, SearchInfo search, String searchPage) {
//		List<Food> foods = service.searchFoodinfo(search);
//		System.out.println(search.getType() + " " + search.getKeyword());
//		model.addAttribute("foods", foods);
//		model.addAttribute("searchInfo", search);
		int recentPage2 = 1;
		int totPage = (int) Math.ceil(service.CntSearchFoodinfo(search) / 5);

		if (searchPage != null && searchPage != "") {
			recentPage2 = Integer.parseInt(searchPage);
		}
		search.setPage((recentPage2-1)*5);
		List<Food> foods = service.searchFoodinfo(search);
		model.addAttribute("foods", foods);
		model.addAttribute("searchtotPage", totPage);
		model.addAttribute("searchInfo", search);
		
		return "foodSearchForm";
	}

	@RequestMapping(value = "addfood.do", method = RequestMethod.GET)
	public String addfood(HttpServletRequest req, Model model, String code) {
		System.out.println("code : " + code);
		HttpSession session = req.getSession();

		String id = ((Member) session.getAttribute("login")).getId();
		System.out.println("id : " + id);

		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
		System.out.println(date);

		Foodlog log = new Foodlog(id, Integer.parseInt(code), date);

		System.out.println("Foodlog : " + log.toString());
		int eatcnt = service.isEat(log);

		System.out.println("eatcnt : " + eatcnt);

		if (eatcnt > 0) {
			int count = service.checkFoodCount(log);
			log.setCount(count);
			service.addFoodCount(log);
		} else {
			service.addNewFood(log);
		}

		return "close";
	}

	@RequestMapping(value = "writeReview.do", method = RequestMethod.POST)
	public String writeReview(Review review, Model model) {
		System.out.println(review.toString());
		rservice.addReview(review);
		return "redirect:/foodDetail.do?code=" + review.getFood_code();
	}

	@RequestMapping(value = "reviewDelete.do", method = RequestMethod.GET)
	public String reviewDelete(Model model, int review_seq, int food_code) {
		rservice.delete(review_seq);
		return "redirect:/foodDetail.do?code=" + food_code;
	}

	@RequestMapping(value = "fooddelete.do", method = RequestMethod.GET)
	public String fooddelete(Model model, Foodlog food) {
		System.out.println(food.toString()+"을 지워!");
		service.fooddelete(food);

		return "redirect:/myInfo.do";
	}

	@RequestMapping(value = "best.do", method = RequestMethod.GET)
	public String best(Model model) {
		List<Food> foods = service.best();
		model.addAttribute("foods", foods);
		return "bestlist";
	}
}
