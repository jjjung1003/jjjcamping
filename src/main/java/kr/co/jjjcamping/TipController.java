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

import kr.co.jjjcamping.dao.NoticeDao;
import kr.co.jjjcamping.dao.TipDao;
import kr.co.jjjcamping.dto.NoticeDto;
import kr.co.jjjcamping.dto.TipDto;

@Controller 
public class TipController {

	@Autowired
	public SqlSession sqlSession;
	
/*---------------------------------------------------------- 꿀팁 ------------*/
	
	@RequestMapping("/tip/tip_list")  //5 층에  캠핑을즐기는 꿀tip
	public String tip_list(Model model,HttpServletRequest request)
	{
	    TipDao tdao = sqlSession.getMapper(TipDao.class);
	    ArrayList<TipDto> list = tdao.tip_list();
	    model.addAttribute("list",list);
	    model.addAttribute("email",request.getParameter("email"));
	    return "/tip/tip_list";
	}
	
	@RequestMapping("/tip/tip_write")
	public String tip_write()
	{		
		return "/tip/tip_write";
	}	
	
	@RequestMapping("/tip/tip_write_ok")
	public String tip_write_ok(TipDto tdto)
	{
		TipDao tdao = sqlSession.getMapper(TipDao.class);
		tdao.tip_write_ok(tdto);
		return "redirect:/tip/tip_list";		
	}	
	
	@RequestMapping("/tip/tip_content")
	public String tip_content(HttpServletRequest requset,Model model)
	{
		String id=requset.getParameter("id");
		TipDao tdao = sqlSession.getMapper(TipDao.class);
		TipDto tdto = tdao.tip_content(id);
		model.addAttribute("tdto",tdto);
		return "/tip/tip_content";		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
