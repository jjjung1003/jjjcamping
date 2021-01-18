package kr.co.jjjcamping;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
import kr.co.jjjcamping.dao.StoreDao;
import kr.co.jjjcamping.dto.CampDto;
import kr.co.jjjcamping.dto.MemberDto;
import kr.co.jjjcamping.dto.ProductDto;
import kr.co.jjjcamping.dto.StoreDto;

@Controller
public class OrderController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/order/order_first")
	public String order_first()
	{
		return "/order/order_first";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
