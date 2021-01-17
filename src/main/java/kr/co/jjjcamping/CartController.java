package kr.co.jjjcamping;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "/cart/cart_add";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
