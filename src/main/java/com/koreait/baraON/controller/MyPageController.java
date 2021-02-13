package com.koreait.baraON.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.myPage.ClubCountCommand;
import com.koreait.baraON.command.myPage.ClubListDeleteCommand;
import com.koreait.baraON.command.myPage.ClubManageListCommand;
import com.koreait.baraON.command.myPage.InfoDeleteCommand;
import com.koreait.baraON.command.myPage.InstantClubCommand;
import com.koreait.baraON.command.myPage.RegularClubCommand;
import com.koreait.baraON.command.myPage.WishDeleteCommand;
import com.koreait.baraON.command.myPage.WishListCommand;

@Controller
public class MyPageController {
	@Autowired
	private SqlSession sqlSession;
	
	private WishListCommand wishListCommand;
	private WishDeleteCommand wishDeleteCommand;
	private RegularClubCommand regularClubCommand;
	private InstantClubCommand instantClubCommand;
	private ClubListDeleteCommand clubListDeleteCommand;
	private InfoDeleteCommand infoDeleteCommand;
	private ClubManageListCommand clubManageListCommand;
	private ClubCountCommand clubCountCommand;
	
	@Autowired
	public void setCommand(WishListCommand wishListCommand,
							 WishDeleteCommand wishDeleteCommand,
							 RegularClubCommand regularClubCommand,
							 InstantClubCommand instantClubCommand,
							 ClubListDeleteCommand clubListDeleteCommand,
							 InfoDeleteCommand InfoDeleteCommand,
							 ClubManageListCommand clubManageListCommand,
							 ClubCountCommand clubCountCommand) {
		this.wishListCommand = wishListCommand;
		this.wishDeleteCommand = wishDeleteCommand;
		this.regularClubCommand = regularClubCommand;
		this.instantClubCommand = instantClubCommand;
		this.clubListDeleteCommand = clubListDeleteCommand;
		this.infoDeleteCommand = InfoDeleteCommand;
		this.clubManageListCommand = clubManageListCommand;
		this.clubManageListCommand = clubManageListCommand;
		this.clubCountCommand = clubCountCommand;
	}
	
	@RequestMapping(value="profile.myPage", method=RequestMethod.GET)
	public String myPage(HttpServletRequest request) {
		return "myPage/profile";
	}
	
	@RequestMapping(value="wishList.myPage", method=RequestMethod.GET)
	public String wishList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		wishListCommand.execute(sqlSession, model);
		return "myPage/wishList";
	}
	
	@RequestMapping(value="wishDelete.myPage", method=RequestMethod.POST)
	public String wishDelete(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		wishDeleteCommand.execute(sqlSession, model);
		return "redirect:wishList.myPage";
	}
	
	@RequestMapping(value="regularClub.myPage", method=RequestMethod.GET)
	public String regularClub(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		regularClubCommand.execute(sqlSession, model);
		return "myPage/regularClub";
	}
	@RequestMapping(value="instantClub.myPage", method=RequestMethod.GET)
	public String instantClub(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		instantClubCommand.execute(sqlSession, model);
		return "myPage/instantClub";
	}
	
	@RequestMapping(value="clubListDelete.myPage", method=RequestMethod.POST)
	public String clubListDelete(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		clubListDeleteCommand.execute(sqlSession, model);
		if(Integer.parseInt(request.getParameter("clubNo")) == 0) {  //정기 모임
			return "redirect:regularClub.myPage";
		} else { //번개 모임
			return "redirect:instantClub.myPage";
		}
	}
	
	@RequestMapping(value="infoDeletePage.myPage", method=RequestMethod.GET)
	public String infoDeletePage(HttpServletRequest request) {
		return "myPage/infoDeletePage";
	}
	
	@RequestMapping(value="infoDelete.myPage", method=RequestMethod.GET)
	public String infoDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		infoDeleteCommand.execute(sqlSession, model);
		return "myPage/infoDeleteResult";
	}
	
	@RequestMapping(value="clubManagePage.myPage", method=RequestMethod.GET)
	public String clubManagePage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		clubManageListCommand.execute(sqlSession, model);
		return "myPage/clubManagePage";
	}
	
	@RequestMapping(value="clubCount/{cNo}", method=RequestMethod.GET, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> clubCount(@PathVariable("cNo") int cNo, Model model) {
		model.addAttribute("cNo", cNo);
		return clubCountCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="clubManageDetailPage.myPage", method=RequestMethod.POST)
	public String clubManageDetailPage(HttpServletRequest request) {
		return "";
	}
	
}