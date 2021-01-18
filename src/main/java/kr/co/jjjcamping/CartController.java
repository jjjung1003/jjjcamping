package kr.co.jjjcamping;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jjjcamping.dao.CartDao;
import kr.co.jjjcamping.dao.ProductDao;
import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.ProductDto;

@Controller
public class CartController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/cart/cart_add")
	public String cart_add(CartDto cdto, HttpSession session)
	{
		CartDao cdao=sqlSession.getMapper(CartDao.class);
		cdao.cart_add(cdto);
		return "redirect:/cart/cart_list";
	}
	
	@RequestMapping("/cart/cart_list")
	public String cart_list(HttpServletRequest request, HttpSession session,Model model)
	{
		String userid=session.getAttribute("userid").toString();
		String code=request.getParameter("code");
		CartDao cdao=sqlSession.getMapper(CartDao.class);
		ArrayList<ProductDto> list=cdao.cart_list(userid);
		model.addAttribute("list", list);
		return "/cart/cart_list";
	}
	
	@RequestMapping("/cart/cart_del")
	public String cart_del(HttpServletRequest request, HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		String id=request.getParameter("id");
		CartDao cdao=sqlSession.getMapper(CartDao.class);
		cdao.cart_del(id);
		return "redirect:/cart/cart_list";
	}	
	
	@RequestMapping("/cart/cart_c_add")
	public String cart_c_add(HttpServletRequest request, CartDto cdto)
	{		
		CartDao cdao=sqlSession.getMapper(CartDao.class);
		cdao.cart_c_add(cdto);
		return "redirect:/cart/cart_c_list";
	}
	
	@RequestMapping("/cart/cart_c_list")
	public String cart_c_list(HttpServletRequest request, Model model) throws UnsupportedEncodingException
	{
		String name="";
		String value="";
		String decVal="";
			
		String strcookie=request.getCookies().toString();
		Cookie[] cookie=request.getCookies();	//쿠키 가져오기
		
		if(cookie != null)
		{
			Cookie[] cookies = request.getCookies();	//쿠키값 읽어오기
			for(int i=0; i<cookies.length; i++)
			{
				if(cookies[i].getName().equals("name"))
				{
					name=cookies[i].getName();
					value=cookies[i].getValue();
					decVal=URLDecoder.decode(value,"utf-8");
				}
			}						
		} else {
			System.out.println("쿠키없음");
		}
		
		CartDao cdao=sqlSession.getMapper(CartDao.class);
		ArrayList<CartDto> list=cdao.cart_c_list(strcookie);		
		model.addAttribute("cookie", cookie);
		model.addAttribute("list", list);
		return "/cart/cart_c_list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
