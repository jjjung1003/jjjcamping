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
import kr.co.jjjcamping.dto.NoticeDto;

@Controller 
public class NoticeController {

	@Autowired
	public SqlSession sqlSession;
	
	/*--------------------------------------------------------------------------------------------   notice   --------*/
	
	@RequestMapping("/notice/write")
	public String write()
	{
		return "/notice/write";
	}
	
	@RequestMapping("/notice/write_ok")
	public String write_ok(NoticeDto ndto,HttpServletRequest request) throws IOException
	{
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
		
		String path="C:\\shop\\pro_camping\\src\\main\\webapp\\WEB-INF\\views\\notice\\img";
		int max=1024*1024*20;
		MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
		
		ndto.setName(multi.getParameter("name"));
		ndto.setTitle(multi.getParameter("title"));
		ndto.setContent(multi.getParameter("content"));
		ndto.setFname(multi.getFilesystemName("fname"));
		File file=multi.getFile("fname");
		ndto.setFsize(file.length());
		
		ndao.write_ok(ndto);
		return "redirect:/notice/list";
	}
	
	@RequestMapping("/notice/list")
	public String list(Model model, HttpServletRequest request)
	{
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);		
		
		String cla, search;
		
		if(request.getParameter("cla") == null)
		{
			cla="title";
			search="";
		}
		else
		{
			cla=request.getParameter("cla");
			search=request.getParameter("search");
		}
		
		int pstart,pend,page,page_cnt;
		
		if(request.getParameter("page") == null)
		{
			page=1;
		}
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int chong=ndao.list_cnt(cla,search);
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
		
		ArrayList<NoticeDto> list=ndao.list(index,cla,search);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("list", list);
		model.addAttribute("cla",cla);
		model.addAttribute("search",search);
		
		return "/notice/list";
	}
	
	@RequestMapping("/notice/hit")
	public String hit(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);		
		ndao.hit(id);
		return "redirect:/notice/content?id="+id;
	}
	
	@RequestMapping("/notice/content")
	public String content(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String chk=request.getParameter("chk");
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
		NoticeDto ndto=ndao.content(id);
		model.addAttribute("ndto", ndto);
		model.addAttribute("chk", chk);
		return "/notice/content";
	}
	
	@RequestMapping("/notice/update")
	public String update(HttpServletRequest request)
	{
			return "/notice/update";
	}
	
	@RequestMapping("/notice/update_ok")
	public String update_ok(NoticeDto ndto,HttpServletRequest request) throws IOException
	{
		String id=request.getParameter("id");
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
		
		String path="C:\\shop\\pro_camping\\src\\main\\webapp\\WEB-INF\\views\\notice\\img";
		int max=1024*1024*20;
		MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
		
		ndto.setName(multi.getParameter("name"));
		ndto.setTitle(multi.getParameter("title"));
		ndto.setContent(multi.getParameter("content"));
		ndto.setFname(multi.getFilesystemName("fname"));
		File file=multi.getFile("fname");
		ndto.setFsize(file.length());
		
		ndao.update_ok(ndto);
		return "redirect:/notice/content?id="+id;
	}
	
	@RequestMapping("/notice/delete")
	public String delete(HttpServletRequest request,HttpSession session)
	{
		String email=session.getAttribute("email").toString();
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");	
		NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
		String dbpwd=ndao.pwd_chk(email);
		
		if(dbpwd.equals(pwd))
		{
			ndao.delete(id);
			return "redirect:/notice/list";
		}
		else 
			return "redirect:/notice/content?chk=1&id="+id;		
	}

	
	
	
	
	
	
	
	
	
	
}
