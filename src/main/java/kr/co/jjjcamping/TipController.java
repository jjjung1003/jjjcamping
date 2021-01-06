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
	
	@RequestMapping("/tip/list")  //5 층에  캠핑을즐기는 꿀tip
	public String tip(Model model, TipDto tdto, HttpServletRequest request)
	{
	    TipDao tdao = sqlSession.getMapper(TipDao.class);
	    ArrayList<TipDto> tip_list = tdao.list();
	    model.addAttribute("tip_list",tip_list);
	    model.addAttribute("email",request.getParameter("email"));
	    return "/tip/list";
	}
	
	@RequestMapping("/tip/write")
	public String write()
	{		
		return "/tip/write";
	}	
	
	@RequestMapping("/tip/write_ok")
	public String write_ok(TipDto tdto)
	{
		TipDao tdao = sqlSession.getMapper(TipDao.class);
		tdao.write_ok(tdto);
		return "redirect:/tip/list";		
	}	
	
	@RequestMapping("/tip/content")
	public String content(HttpServletRequest requset,Model model)
	{
		String id=requset.getParameter("id");
		TipDao tdao = sqlSession.getMapper(TipDao.class);
		TipDto tipdto = tdao.content(id);
		model.addAttribute("tipdto",tipdto);
		return "/tip/content";		
	}
	
	
/*---------------------------------------------------------- 매장안내 ------------*/
	
	
	
	
	
	
	
	
	
	
	
	
}
