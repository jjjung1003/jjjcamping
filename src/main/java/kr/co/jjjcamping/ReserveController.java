package kr.co.jjjcamping;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jjjcamping.dao.ReserveDao;
import kr.co.jjjcamping.dto.ReserveDto;

@Controller
public class ReserveController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/reserve/information")
	public String information()
	{
		return "/reserve/information";
	}
	
	@RequestMapping("/reserve/infor_A")	//A캠프장 소개
	public String infor_A()
	{
		return "/reserve/infor_A";
	}
	
	@RequestMapping("/reserve/infor_B")	//B캠프장 소개
	public String infor_B()
	{
		return "/reserve/infor_B";
	}
	
	@RequestMapping("/reserve/reserve_first")
	public String reserve_first(HttpSession session)
	{
		return "/reserve/reserve_first";
	}
	
	@RequestMapping("/reserve/reserve_second")	
	public String reserve_second(ReserveDto rdto, Model model, HttpSession session)
	{	
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		rdao.reserve_second(rdto);
		model.addAttribute("rdto", rdto);
		model.addAttribute("userid", session.getAttribute("userid").toString());
		model.addAttribute("name", session.getAttribute("name").toString());
		model.addAttribute("rdto", rdto);
		return "/reserve/reserve_second";
	}

	
	
	
	
	
	
	
	
	
	
	
}
