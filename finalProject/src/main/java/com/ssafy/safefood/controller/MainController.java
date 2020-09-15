package com.ssafy.safefood.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.safefood.model.Food;
import com.ssafy.safefood.model.Foodlog;
import com.ssafy.safefood.model.Intake;
import com.ssafy.safefood.model.Member;
import com.ssafy.safefood.service.IFoodService;
import com.ssafy.safefood.service.IMemberService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private IMemberService memberservice;

	@Autowired
	private IFoodService service;

	@RequestMapping(value = "calendar.do", method = { RequestMethod.GET })
	public String calendar(HttpServletRequest req, Model model) {
		logger.debug("Welcome LoginController calendar! " + new Date());
		String year = null;
		year = req.getParameter("year");
		String month = null;
		month = req.getParameter("month");

		req.setAttribute("year", year);
		req.setAttribute("month", month);
		return "calendar";
	}//

	@RequestMapping(value = "loadMap.do", method = RequestMethod.GET)
	public String loadMap(Model model) {
		logger.debug("Welcome LoginController index! " + new Date());
		return "loadmap";
	}

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Model model) {
		logger.debug("Welcome LoginController index! " + new Date());
		return "index";
	}

	@RequestMapping(value = "loginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm(Model model, String fail) {
		logger.debug("Welcome LoginController loginForm! " + new Date());
		if (fail != null && fail.equals("true"))
			model.addAttribute("fail", fail);
		System.out.println(fail);
		return "loginForm";
	}//

	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest req, Member member, Model model) {
		logger.info("Welcome MainController login! " + new Date());
		System.out.println(member.getId() + " / " + member.getPwd());
		int result = memberservice.idCheck(member);
		HttpSession session = req.getSession();
		if (result == 1) {
			Member login = memberservice.login(member);
			session.setAttribute("login", login);
			System.out.println("login : " + login.toString());
			return "index";
		} else {
			// 안됐을 경우, 로그인 창으로 다시
			return "redirect:/loginForm.do?fail=true"; // 수정해야함.
		}
	}

	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest req, Member member, Model model) {
		logger.info("Welcome MainController logout! " + new Date());
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}

	// registerForm
	@RequestMapping(value = "registerForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String registerForm(Model model) {
		logger.debug("Welcome LoginController registerForm! " + new Date());
		return "registerForm";
	}

	// id 체크
	@RequestMapping(value = "idCheck.do", method = { RequestMethod.POST })
	@ResponseBody
	public String idCheck(String id, Model model) {
		logger.info("Welcome MainController logout! " + new Date());

		int result = memberservice.duplicationCheck(id);
		String message = "";
		if (result == 0) {
			message = "사용 가능한 아이디입니다.";
		} else {
			message = "사용이 불가능합니다.";
		}

		return message;
	}

	@RequestMapping(value = "findPw.do", method = { RequestMethod.POST })
	@ResponseBody
	public String findPw(Member input, Model model) {
		logger.info("Welcome MainController logout! " + new Date());
		System.out.println(input.toString() + "~~~~~~~~");
		int result = memberservice.findPW(input);
		String message = "";
		System.out.println("~~~~~~~~~~~~~~~~~" + result);
		// 랜덤 비밀번호 만들기

		String newPwd = "";
		String tmp = "";
		while (newPwd.length() < 9) {
			double randomValue = Math.random();
			int intValue = (int) (randomValue * (25));
			char tmpChar = (char) ('A' + intValue);
			tmp = tmpChar + "";
			if (newPwd.length() % 2 == 0) {
				tmp = tmp.toLowerCase();
			}
			newPwd += tmp;
		}
		if (result > 0) {
			message = "임시 비밀번호는 " + newPwd + "입니다.";
			input.setPwd(newPwd);
			memberservice.tmpPw(input);
		} else {
			message = "제대로 된 답변을 입력하세요.";
		}

		return message;
	}

	// register
	@RequestMapping(value = "regi.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String registerForm(HttpServletRequest req, Member member, Model model) {
		logger.debug("Welcome LoginController registerForm! " + new Date());
		String[] allergys = req.getParameterValues("box");
		String all = "";
		boolean fir = false;
		if (allergys == null) {	
			all += " ";
		} else {
			for (int i = 0; i < allergys.length; i++) {
				all += allergys[i] + ",";
			}
			if (all.length() > 0)
				all = all.substring(0, all.length() - 1);
			member.setAllergy(all);
		}

		String[] options = req.getParameterValues("options");
		String op = "";
		if (options == null) {
			op += " ";
			member.setPrimaryop(member.getGender());
		} else {
			for (int i = 0; i < options.length; i++) {
				op += options[i] + ",";
			}
			if (op.length() > 0)
				op = op.substring(0, op.length() - 1);
			// 프라이머리 옵션 고르는 위치
			// 임신 유아 고혈압 당뇨 비만 학생 (남자, 여자) 순으로
			if (op.contains("임산부")) {
				member.setPrimaryop("임산부");
			} else if (op.contains("유아")) {
				member.setPrimaryop("유아");
			} else if (op.contains("고혈압")) {
				member.setPrimaryop("고혈압");
			} else if (op.contains("당뇨")) {
				member.setPrimaryop("당뇨");
			} else if (op.contains("비만")) {
				member.setPrimaryop("비만");
			} else if (op.contains("학생")) {
				member.setPrimaryop("학생");
			} else {
				member.setPrimaryop(member.getGender());
			}
			member.setSpecial(op);
		}
		System.out.println(member.getPrimaryop());
		System.out.println(member.toString());
		memberservice.regi(member);
		return "redirect:/loadMap.do";
	}

	// members
	@RequestMapping(value = "members.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String members(Model model) {
		logger.debug("Welcome LoginController members! " + new Date());
		model.addAttribute("members", memberservice.findAllMembers());
		return "members";
	}

	// go to findForm
	@RequestMapping(value = "findForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String findForm(Model model) {
		logger.debug("Welcome LoginController findForm! " + new Date());
		return "findForm";
	}//

	@RequestMapping(value = "edit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String goEidt() {
		logger.debug("Welcome LoginController findForm! " + new Date());
		return "editForm";
	}

	@RequestMapping(value = "myInfo.do", method = { RequestMethod.GET })
	public String myInfo(HttpServletRequest req, String inputDate, Model model) {
		logger.debug("Welcome LoginController myInfo! " + new Date());
		HttpSession session = req.getSession();
		String id = ((Member) session.getAttribute("login")).getId();
		Member myself = memberservice.myself(id);
		Calendar cal = Calendar.getInstance();
		String date = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
		String thisDate = "";
		int inputMonth = 0;
		int inputYear = 2000;
		if (inputDate != null) {
			date = inputDate;
			StringTokenizer st = new StringTokenizer(inputDate, "-");
			inputYear = Integer.parseInt(st.nextToken());
			model.addAttribute("year", inputYear);
			inputMonth = Integer.parseInt(st.nextToken()) - 1;
			model.addAttribute("month", inputMonth);
			inputMonth++;
			thisDate = inputYear + "-" + inputMonth + "-";
			model.addAttribute("day", st.nextToken());
		} else {
			inputYear = cal.get(Calendar.YEAR);
			model.addAttribute("year", inputYear);
			inputMonth = cal.get(Calendar.MONTH);
			model.addAttribute("month", inputMonth);
			inputMonth++;
			thisDate = inputYear + "-" + inputMonth + "-";
		}
		System.out.println(date);
		List<Foodlog> foods = null;
		foods = service.findFoodlogs(new Intake(id, date));
		Foodlog best = null;
		int able = 0;
		System.out.println(thisDate);
		if (foods.size() > 0) {
			System.out.println("여기지롱~~~~!!!! " + foods.get(0).getDate());
			best = service.findBest(id);
			able = service.bestCheck(id);
		}

		// isEattenDay 써서 이날 먹었는지 안먹었는지 표시할거야!
		int Max = 30;
		if (inputMonth == 1 || inputMonth == 3 || inputMonth == 5 || inputMonth == 7 || inputMonth == 8
				|| inputMonth == 10 || inputMonth == 12)
			Max = 31;
		else if (inputMonth == 2) {
			if (inputYear % 4 == 0)
				Max = 29;
			else
				Max = 28;
		} else {
			Max = 30;
		}
		String eatDay = "X";
		for (int i = 1; i < Max + 1; i++) {
			String tmpDay = Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);
			if (service.isEattenDay(new Intake(id, thisDate + tmpDay))) {
				eatDay += "Y";
			} else {
				eatDay += "N";
			}
		}
		System.out.println();
//		req.setAttribute("inputDate", date);
		model.addAttribute("inputDate", date);
		model.addAttribute("foods", foods);
		model.addAttribute("myself", myself);
		model.addAttribute("best", best);

		if (able > 0) {
			model.addAttribute("able", "7");
			Food f = service.searchFoodnutri(best.getFood_code());
			model.addAttribute("f", f);
		} else {
			model.addAttribute("able", "0");
		}
		model.addAttribute("eatten", eatDay);
		System.out.println(eatDay);
		return "myInfo";
	}

	/*
	 * // myInfo.do
	 * 
	 * @RequestMapping(value = "myInfo.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String myInfo(HttpServletRequest req, Model
	 * model) { logger.debug("Welcome LoginController myInfo! " + new Date());
	 * HttpSession session = req.getSession(); String id = ((Member)
	 * session.getAttribute("login")).getId(); Member myself =
	 * memberservice.myself(id);
	 * 
	 * List<Foodlog> foods = service.findFoodlogs(id);
	 * 
	 * Foodlog best = service.findBest(id);
	 * 
	 * int able = service.bestCheck(id);
	 * 
	 * model.addAttribute("foods", foods); model.addAttribute("myself", myself);
	 * model.addAttribute("best", best); if (able > 0) { model.addAttribute("able",
	 * "7"); Food f = service.searchFoodnutri(best.getName());
	 * model.addAttribute("f", f); } else { model.addAttribute("able", "0"); }
	 * return "myInfo"; }
	 */
	// detail.do
	@RequestMapping(value = "detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String detail(String id, Model model) {
		logger.debug("Welcome LoginController detail! " + new Date());
		Member myself = memberservice.myself(id);
		model.addAttribute("myself", myself);
		return "myInfo";
	}

	// update.do
	@RequestMapping(value = "update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String update(HttpServletRequest req, Member member, Model model) {
		logger.debug("Welcome LoginController update! " + new Date());
		String[] allergys = req.getParameterValues("box");
		String all = "";
		if (allergys == null) {
			all = " ";
		} else {
			for (int i = 0; i < allergys.length; i++) {
				all += allergys[i] + ",";
			}
			if (all.length() > 0)
				all = all.substring(0, all.length() - 1);
			member.setAllergy(all);
		}

		String[] options = req.getParameterValues("options");
		String op = "";
		if (options == null) {
			op += " ";
			member.setPrimaryop(member.getGender());
		} else {
			for (int i = 0; i < options.length; i++) {
				op += options[i] + ",";
			}
			if (op.length() > 0)
				op = op.substring(0, op.length() - 1);
			// 프라이머리 옵션 고르는 위치
			// 임신 유아 고혈압 당뇨 비만 학생 (남자, 여자) 순으로
			if (op.contains("임산부")) {
				member.setPrimaryop("임산부");
			} else if (op.contains("유아")) {
				member.setPrimaryop("유아");
			} else if (op.contains("고혈압")) {
				member.setPrimaryop("고혈압");
			} else if (op.contains("당뇨")) {
				member.setPrimaryop("당뇨");
			} else if (op.contains("비만")) {
				member.setPrimaryop("비만");
			} else if (op.contains("학생")) {
				member.setPrimaryop("학생");
			} else {
				member.setPrimaryop(member.getGender());
			}
			member.setSpecial(op);
		}

		System.out.println(member.toString());
		memberservice.myselfUp(member);
		req.getSession().setAttribute("login", memberservice.login(member));
		return "redirect:/myInfo.do";
	}

	// delete.do
	@RequestMapping(value = "delete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(HttpServletRequest req, Member member, Model model) {
		logger.debug("Welcome LoginController delete! " + new Date());
		memberservice.deleteme(member.getId());
		
		Member me = (Member)(req.getSession().getAttribute("login"));
		String auth = me.getAuth();
		
		if(auth.equals("1"))
			return "redirect:/members.do";
//		
		
		return "redirect:/logout.do";
	}
}
