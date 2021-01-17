package kr.co.jjjcamping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jjjcamping.command.Product_listCommand;
import kr.co.jjjcamping.dao.CartDao;
import kr.co.jjjcamping.dao.ProductDao;
import kr.co.jjjcamping.dto.CartDto;
import kr.co.jjjcamping.dto.ProductDto;

@Controller
public class ProductController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/product/pro_list")
	public String admin_list(HttpServletRequest request, ProductDto pdto, Model model)
	{
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		Product_listCommand plc=new Product_listCommand(); 
		plc.pro_list(request, pdao, model);
		return "/product/pro_list";
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
