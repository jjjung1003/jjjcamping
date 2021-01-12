package kr.co.jjjcamping;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jjjcamping.dao.CsDao;
import kr.co.jjjcamping.dao.CsDatDao;
import kr.co.jjjcamping.dto.CsDatDto;
import kr.co.jjjcamping.dto.CsDto;

@Controller
public class CsController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/cs/write")
	public String write(HttpSession session)
	{	
		return "/cs/write";
	}
	
	@RequestMapping("/cs/write_ok")
	public String write_ok(CsDto cdto)
	{
		CsDao cdao=sqlSession.getMapper(CsDao.class);
		cdao.write_ok(cdto);
		return "redirect:/cs/list";
	}
	
	@RequestMapping("/cs/list")
	public String list(HttpServletRequest request,Model model)
	{
		CsDao cdao=sqlSession.getMapper(CsDao.class);
		
		//검색단 시작
		String cla, search;
		
		if(request.getParameter("cla")==null)
		{
			cla="id";
			search="";
		}
		else
		{
			cla=request.getParameter("cla");
			search=request.getParameter("search");
		}
		//검색단 끝
		
		//페이징 시작
		int page, page_cnt, pstart, pend;
		
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int chong=cdao.list_cnt(cla,search);
		
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
		//페이징 끝
		
		ArrayList<CsDto> cslist=cdao.list(cla,search,index);
		
		model.addAttribute("cslist", cslist);
		model.addAttribute("cla", cla);
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("index", index);
		
		return "/cs/list";
	}
	
	@RequestMapping("/cs/content")
	public String content(HttpServletRequest request,Model model,HttpSession session)
	{
		String id=request.getParameter("id");
		String userid=session.getAttribute("userid").toString();
		CsDao cdao=sqlSession.getMapper(CsDao.class);
		CsDto cdto=cdao.content(id);
		model.addAttribute("cdto", cdto);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("userid", userid);
		
		//댓글
		CsDatDao cddao=sqlSession.getMapper(CsDatDao.class);
		ArrayList<CsDatDto> list=cddao.get_csdat(id);
		model.addAttribute("list", list);
		model.addAttribute("session", session);
		
		return "/cs/content";
	}
	
	@RequestMapping("/cs/csdat_ok")
	public String csdat_ok(CsDatDto cddto,HttpServletRequest request)
	{
		CsDatDao cddao=sqlSession.getMapper(CsDatDao.class);
		cddao.csdat_ok(cddto);
		return "redirect:/cs/content?id="+cddto.getCsid()+"&page="+request.getParameter("page");
	}
	
	@RequestMapping("/cs/csdat_del")
	public String dat_del(CsDatDto cddto,HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String csid=request.getParameter("csid");
		CsDatDao cddao=sqlSession.getMapper(CsDatDao.class);
		cddao.csdat_del(id);
		return "redirect:/cs/content?id="+cddto.getCsid()+"&did="+id+"&page="+request.getParameter("page")+"&chk=1";
	}
	
	@RequestMapping("/cs/delete")
	public String delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		CsDao cdao=sqlSession.getMapper(CsDao.class);
		cdao.delete(id);
		return "redirect:/cs/list";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
