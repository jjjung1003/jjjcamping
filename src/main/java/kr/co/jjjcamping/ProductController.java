package kr.co.jjjcamping;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/product/pro_list")
	public String admin_list()
	{
		return "/product/pro_list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
