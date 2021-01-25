package kr.co.jjjcamping;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jjjcamping.command.Product_write_okCommand;
import kr.co.jjjcamping.dao.AdminDao;
import kr.co.jjjcamping.dao.CampDao;
import kr.co.jjjcamping.dao.CartDao;
import kr.co.jjjcamping.dao.MemberDao;
import kr.co.jjjcamping.dao.OrderDao;
import kr.co.jjjcamping.dao.StoreDao;
import kr.co.jjjcamping.dto.CampDto;
import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.MemberDto;
import kr.co.jjjcamping.dto.OrderDto;
import kr.co.jjjcamping.dto.ProductDto;
import kr.co.jjjcamping.dto.StoreDto;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
public class OrderController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/order/order_first")
	public String order_first(HttpSession session, HttpServletRequest request, Model model)
	{
		String userid=session.getAttribute("userid").toString();
		String tot_price=request.getParameter("tot_price");
		
		OrderDao odao=sqlSession.getMapper(OrderDao.class);
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
				
		ArrayList<CartDto> list=odao.order_first(userid);
		MemberDto mdto=mdao.mypage(userid);
		
		model.addAttribute("list", list);
		model.addAttribute("tot_price", tot_price);
		model.addAttribute("mdto", mdto);
		return "/order/order_first";
	}

	@RequestMapping("/order/order_second")
	public String order_second(HttpSession session, HttpServletRequest request, OrderDto odto)
	{		
		String o_code=request.getParameter("o_code");
		String point=request.getParameter("point");
		OrderDao odao=sqlSession.getMapper(OrderDao.class);
		odao.order_second(odto);
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.point_update(point,session.getAttribute("userid").toString());
		return "redirect:/order/order_complete?o_code="+o_code+"&point="+point;
	}
	
	@RequestMapping("/order/order_complete")
	public String order_complete(HttpSession session, HttpServletRequest request, Model model)
	{		
		String userid=session.getAttribute("userid").toString();
		String o_code=request.getParameter("o_code");
		String point=request.getParameter("point");
		OrderDao odao=sqlSession.getMapper(OrderDao.class);		
		OrderDto odto=odao.order_complete(userid, o_code);
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		model.addAttribute("odto", odto);
		model.addAttribute("point", point);
		return "/order/order_complete";
	}
	
	@RequestMapping("/order/deliv_list")
	public String deliv_list()
	{		
		return "/order/deliv_list";
	}
	
	
	
	
	
	
	
	
	
	
	
}
