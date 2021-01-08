package kr.co.jjjcamping;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jjjcamping.dao.StoreDao;
import kr.co.jjjcamping.dto.StoreDto;

@Controller
public class StoreController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/store/list")
	public String list(HttpServletRequest request, Model model)
	{
		StoreDao sdao=sqlSession.getMapper(StoreDao.class);
		
		/*검색단*/
		String cla, search;
		
		if(request.getParameter("cla")==null)
		{
			cla="title";
			search="";
		}
		else
		{
			cla=request.getParameter("cla");
			search=request.getParameter("search");
		}	
		
		/*페이징*/
		int pstart,pend,page,page_cnt;
		
		if(request.getParameter("page") == null)
		{
			page=1;
		}
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int chong=sdao.list_cnt(cla,search);
		page_cnt=chong/10;	
		
		if(chong%10 != 0)	
			page_cnt=page_cnt+1;
		
		pstart=page/10;	
		
		if(page%10 == 0)	
			pstart=pstart-1;
		
		pstart=pstart*10+1;			
		pend=pstart+9;	
		
		if(pend > page_cnt)
			pend=page_cnt;
		
		int index;
		index=(page-1)*10;
		

		ArrayList<StoreDto> slist=sdao.list(cla,search,index);
		
		model.addAttribute("slist", slist);
		model.addAttribute("cla", cla);
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);

		return "/store/list";
	}
	
	@RequestMapping("/store/content")
	public String content(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		StoreDao sdao=sqlSession.getMapper(StoreDao.class);
		StoreDto sdto=sdao.content(id);	
		model.addAttribute("sdto", sdto);
		return "/store/content";		
	}
	
	@RequestMapping("/store/delete")
	public String delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		StoreDao sdao=sqlSession.getMapper(StoreDao.class);
		sdao.delete(id);
		return "redirect:/store/list";		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
