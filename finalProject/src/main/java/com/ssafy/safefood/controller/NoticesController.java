package com.ssafy.safefood.controller;


import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.safefood.model.Comment;
import com.ssafy.safefood.model.Notices;
import com.ssafy.safefood.service.INoticesService;

@Controller
public class NoticesController {
	private static final Logger logger = 
			LoggerFactory.getLogger(NoticesController.class);
	
	@Autowired
	private INoticesService noticeservice;
	
	@RequestMapping(value = "noticeupdate.do", 
			method = RequestMethod.GET)
	public String noticeupdate(String seq, Model model) {
		logger.info("Welcome MainController noticedetail! "+ new Date());
		System.out.println("admin만 들어올 수 있는 noticeupdate로 가보자"+seq);
		model.addAttribute("notice", noticeservice.noticedetail(seq));
		return "noticeupdate";
	}
	
	@RequestMapping(value = "noticelist.do", 
			method = RequestMethod.GET)
	public String noticelist(Model model) {
		logger.info("Welcome MainController noticelist! "+ new Date());
		model.addAttribute("notices", noticeservice.getNoticesList());
		return "noticelist";
	}
	
	@RequestMapping(value = "addnotice.do", 
			method = RequestMethod.GET)
	public String addnotice(Model model) {
		logger.info("Welcome MainController addnotice! "+ new Date());
		return "addnotice";
	}
	
	@RequestMapping(value = "addnoticeaf.do", 
			method = RequestMethod.POST)
	public String addnoticeaf(Notices notice, Model model) {
		logger.info("Welcome MainController addnotice! "+ new Date());
		noticeservice.addnotices(notice);
		return "redirect:/noticelist.do";
	}

	@RequestMapping(value = "noticedetail.do", 
			method = RequestMethod.GET)
	public String noticedetail(String seq, Model model) {
		logger.info("Welcome MainController noticedetail! "+ new Date());
		model.addAttribute("notice", noticeservice.noticedetail(seq));
		model.addAttribute("comments", noticeservice.getCommentsList(Integer.parseInt(seq)));
		return "noticedetail";
	}
	
	@RequestMapping(value = "updatenotice.do", 
			method = RequestMethod.POST)
	public String updatenotice(Notices notice, Model model) {
		logger.info("Welcome MainController noticedetail! "+ new Date());
		noticeservice.update(notice);
		return "redirect:/noticelist.do";
	}
	
	@RequestMapping(value = "noticedelete.do", 
			method = RequestMethod.GET)
	public String noticedelete(String seq, Model model) {
		logger.info("Welcome MainController noticedetail! "+ new Date());
		noticeservice.delete(seq);
		return "redirect:/noticelist.do";
	}	
	
	/////////////////////////////////////
	@RequestMapping(value = "addcomment.do", 
			method = RequestMethod.POST)
	public String addcomment(Comment comment, Model model) {
		logger.info("Welcome MainController noticedetail! "+ new Date());
		noticeservice.addcomment(comment);
		return "redirect:/noticedetail.do?seq="+comment.getNotice_seq();
	}
	
	//commentdelete.do
	@RequestMapping(value = "commentdelete.do", 
			method = RequestMethod.GET)
	public String commentdelete(Comment comment, Model model) {
		logger.info("Welcome MainController noticedetail! "+ new Date());
		noticeservice.commentdelete(comment);
		return "redirect:/noticedetail.do?seq="+comment.getNotice_seq();
	}
	
}
