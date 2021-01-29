package kr.co.jjjcamping;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jjjcamping.dao.NoticeDao;
import kr.co.jjjcamping.dto.NoticeDto;

@Controller 
public class NoticeController {

	@Autowired
	public SqlSession sqlSession;
	
	/*--------------------------------------------------------------------------------------------   notice   --------*/
	
	@RequestMapping("/notice/notice_write")
	public String write(HttpSession session)
	{
		if(session.getAttribute("userid").equals("admin"))
			return "/notice/notice_write";
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/notice/notice_write_ok")
	public String write_ok(NoticeDto ndto,HttpServletRequest request,HttpSession session) throws IOException
	{
		if(session.getAttribute("userid").equals("admin"))
		{
			NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
			
			String path="C:\\shop\\pro_camping\\src\\main\\webapp\\WEB-INF\\views\\notice\\img";
			int max=1024*1024*20;
			MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
			
			ndto.setName(multi.getParameter("name"));
			ndto.setTitle(multi.getParameter("title"));
			ndto.setContent(multi.getParameter("content"));
			ndto.setFname(multi.getFilesystemName("fname"));
			File ifile=multi.getFile("fname");
			ndto.setFsize(ifile.length());
			//동영상.. x
			/*ndto.setVname(multi.getFilesystemName("vname"));
			File vfile=multi.getFile("vname");
			ndto.setVsize(vfile.length());*/
			
			ndao.write_ok(ndto);
			return "redirect:/notice/notice_list";
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/notice/notice_list")
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
		
		return "/notice/notice_list";
	}
	
	@RequestMapping("/notice/notice_hit")
	public String hit(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("userid").equals("admin"))
		{
			String id=request.getParameter("id");
			NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);		
			ndao.hit(id);
			return "redirect:/notice/notice_content?id="+id;
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/notice/notice_content")
	public String content(HttpSession session, HttpServletRequest request, Model model)
	{
		if(session.getAttribute("userid").equals("admin"))
		{
			String id=request.getParameter("id");
			String chk=request.getParameter("chk");
			NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
			NoticeDto ndto=ndao.content(id);
			model.addAttribute("ndto", ndto);
			model.addAttribute("chk", chk);
			return "/notice/notice_content";
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/notice/notice_update")
	public String update(HttpSession session, HttpServletRequest request,  Model model)
	{
		if(session.getAttribute("userid").equals("admin"))
		{
			String id=request.getParameter("id");
			NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
			NoticeDto ndto=ndao.update(id);
			model.addAttribute("ndto", ndto);
			return "/notice/notice_update";
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/notice/notice_update_ok")
	public String update_ok(NoticeDto ndto,HttpServletRequest request,HttpSession session) throws IOException
	{
		if(session.getAttribute("userid").equals("admin"))
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
			return "redirect:/notice/notice_content?id="+id;
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/notice/notice_delete")
	public String delete(HttpServletRequest request,HttpSession session)
	{
		if(session.getAttribute("userid").equals("admin"))
		{
			String id=request.getParameter("id");
			NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
			ndao.delete(id);
			return "redirect:/notice/notice_list";	
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	/*@RequestMapping(value = "/video/{id}", method = RequestMethod.GET)	//동영상.. 실패
	public void getVideo(HttpServletRequest request, HttpServletResponse response, @PathVariable String id)
	{
		String filePath = FILE_PATH;
		
		FileModel fileModel = fileService.getFileInfo(Integer.parseInt(id));
		
		logger.info("동영상 스트리밍 요청: "+filePath + fileModel.getSaveFileName());
		
		File getFile = new File(filePath + fileModel.getSaveFileName());
		
		try {
			MultipartFileSender
			.fromFile(getFile)
			.with(request)
			.with(response)
			.serveResource();
		} catch (Exception e) {
			if(!e.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")) e.printStackTrace();
		}
	}*/
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
}
