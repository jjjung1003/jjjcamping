package kr.co.jjjcamping;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jjjcamping.dao.CampDao;
import kr.co.jjjcamping.dao.ReserveDao;
import kr.co.jjjcamping.dto.CampDto;
import kr.co.jjjcamping.dto.ReserveDto;

@Controller
public class ReserveController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/reserve/camp_list")
	public String camp_list(Model model)
	{
		CampDao cdao=sqlSession.getMapper(CampDao.class);
		ArrayList<CampDto> list=cdao.camp_list();
		model.addAttribute("list", list);
		return "/reserve/camp_list";
	}
	
	@RequestMapping("/reserve/camp_content")	//A캠프장 소개
	public String camp_content(HttpServletRequest request, Model model)
	{
		CampDao cdao=sqlSession.getMapper(CampDao.class);
		CampDto cdto=cdao.camp_content(request.getParameter("id"));
		model.addAttribute("cdto", cdto);
		return "/reserve/camp_content";
	}
	
	@RequestMapping("/reserve/reserve_first")
	public String reserve_first(HttpSession session)
	{
		return "/reserve/reserve_first";
	}
	
	@RequestMapping("/reserve/reserve_second")	
	public String reserve_second(ReserveDto rdto, HttpSession session)
	{	
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		rdao.reserve_second(rdto);
		return "/reserve/reserve_second";
	}
	
	@RequestMapping("/reserve/reserve_1")
	public String reserve_1()
	{
		return "/reserve/reserve_1";
	}
	
	@RequestMapping("member/my_reserve")
	public String my_reserve(HttpSession session,Model model)
	{
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = transFormat.format(date);		
		
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		ArrayList<ReserveDto> list=rdao.my_reserve(session.getAttribute("userid").toString());
		model.addAttribute("list", list);
		model.addAttribute("today", today);
		return "member/my_reserve";
	}
	
	@RequestMapping("/reserve/reserve_del")
	public String reserve_del(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		rdao.reserve_del(id);
		return "redirect:/member/my_reserve";
	}

	
	
	
	
	
	
	
	
	
	
}
