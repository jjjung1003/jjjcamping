package kr.co.jjjcamping;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import kr.co.jjjcamping.dao.MemberDao;
import kr.co.jjjcamping.dao.ProductDao;
import kr.co.jjjcamping.dao.ReserveDao;
import kr.co.jjjcamping.dto.CampDto;
import kr.co.jjjcamping.dto.MemberDto;
import kr.co.jjjcamping.dto.ProductDto;
import kr.co.jjjcamping.dto.ReserveDto;
import kr.co.jjjcamping.dto.StoreDto;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/admin/admin_list")
	public String admin_list(HttpSession session)
	{
		if(session.getAttribute("userid").equals("admin"))
		{			
			return "/admin/admin_list";
		}			
		else	
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/admin/store_write")
	public String store_write(HttpSession session)
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			return "/admin/store_write";
		}			
		else
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/admin/store_write_ok")
	public String store_write_ok(HttpSession session,StoreDto sdto, HttpServletRequest request) throws IOException
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			AdminDao adao=sqlSession.getMapper(AdminDao.class);
			
			String path="C:\\web_spring\\jjjcamping\\src\\main\\webapp\\WEB-INF\\views\\store\\img";
			int max=1024*1024*20;
			MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
			
			sdto.setRegion(multi.getParameter("region"));
			sdto.setTitle(multi.getParameter("title"));
			sdto.setAddress(multi.getParameter("address"));
			sdto.setPhone(multi.getParameter("phone"));
			sdto.setM_img(multi.getFilesystemName("m_img"));
			File file=multi.getFile("m_img");
			sdto.setM_imgsize(file.length());
			
			adao.store_write_ok(sdto);
			return "/admin/store_write_ok";
		}			
		else
		{	
			session.invalidate();
			return "redirect:/login/login";			
		}	
	}
	
	@RequestMapping("/admin/camp_write")
	public String camp_write(HttpSession session)
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			return "/admin/camp_write";
		}			
		else
		{	
			session.invalidate();
			return "redirect:/login/login";			
		}	
	}
	
	@RequestMapping("/admin/camp_write_ok")
	public String camp_write_ok(HttpSession session, CampDto cdto, HttpServletRequest request) throws IOException
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			AdminDao adao=sqlSession.getMapper(AdminDao.class);
			
			String path="C:\\web_spring\\jjjcamping\\src\\main\\webapp\\WEB-INF\\views\\admin\\img";
			int max=1024*1024*20;
			MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
			
			cdto.setTitle(multi.getParameter("title"));
			cdto.setAddress(multi.getParameter("address"));
			cdto.setPhone(multi.getParameter("phone"));
			cdto.setM_img(multi.getFilesystemName("m_img"));
			cdto.setD_img(multi.getFilesystemName("d_img"));
			File mfile=multi.getFile("m_img");
			cdto.setM_imgsize(mfile.length());
			File dfile=multi.getFile("d_img");
			cdto.setD_imgsize(dfile.length());
			cdto.setOn_price(multi.getParameter("on_price"));
			cdto.setOff_price(multi.getParameter("off_price"));
			
			adao.camp_write_ok(cdto);
			return "redirect:/admin/admin_list";
		}			
		else
		{
			session.invalidate();
			return "redirect:/login/login";			
		}	
	}
	
	@RequestMapping("/admin/product_write")
	public String product_write(HttpSession session)
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			return "/admin/product_write";
		}				
		else
		{	
			session.invalidate();
			return "redirect:/login/login";
		}	
	}
	
	@RequestMapping("/admin/product_write_ok")
	public String product_write_ok(HttpSession session, ProductDto pdto, HttpServletRequest request) throws IOException
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			AdminDao adao=sqlSession.getMapper(AdminDao.class);
			
			String path="C:\\web_spring\\jjjcamping\\src\\main\\webapp\\WEB-INF\\views\\admin\\img\\product";
			int max=1024*1024*20;
			MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
			
			Product_write_okCommand pwoc=new Product_write_okCommand();
			pwoc.product_write_ok(multi,adao);		
					
			return "redirect:/admin/product_write";
		}			
		else
		{
			session.invalidate();
			return "redirect:/login/login";			
		}	
	}
	
	@RequestMapping("/admin/product_all_list")
	public String product_list(Model model, HttpServletRequest request,HttpSession session)
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			AdminDao adao=sqlSession.getMapper(AdminDao.class);
			
			String cla, search;
			if(request.getParameter("cla") == null)
			{
				cla="pro_name";
				search="";
			}
			else
			{
				cla=request.getParameter("cla");
				search=request.getParameter("search");
			}
			
			ArrayList<ProductDto> list=adao.product_all_list(cla,search);
			model.addAttribute("list", list);
			model.addAttribute("cla", cla);	
			model.addAttribute("search", search);	
			return "/admin/product_all_list";
		}				
		else
		{	
			session.invalidate();
			return "redirect:/login/login";			
		}	
	}
	
	@RequestMapping("/admin/product_update")
	public String product_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		ProductDto pdto=adao.product_update(id);
		model.addAttribute("pdto", pdto);
		return "/admin/product_update";
	}
	
	@RequestMapping("/admin/product_update_ok")
	public String product_update_ok(ProductDto pdto)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		adao.product_update_ok(pdto);
		return "redirect:/admin/product_all_list";
	}
		
	@RequestMapping("/admin/product_del")
	public String product_del(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		adao.product_del(id);
		return "redirect:/admin/product_all_list";
	}
	
	@RequestMapping("/admin/member_list")
	public String mem_view(Model model, HttpServletRequest request,HttpSession session)
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{			
			AdminDao adao = sqlSession.getMapper(AdminDao.class);
			
			String cla, search;
			if(request.getParameter("cla") == null)
			{
				cla="id";
				search="";
			}
			else
			{
				cla=request.getParameter("cla");
				search=request.getParameter("search");
			}
			
			ArrayList<MemberDto> list = adao.member_list(cla,search);
			model.addAttribute("list",list);
			return "/admin/member_list";
		}			
		else
		{	
			session.invalidate();
			return "redirect:/login/login";			
		}	
	}
	
	@RequestMapping("/admin/reserve_check")
	public String reserve_check(HttpSession session, Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto=mdao.mypage(session.getAttribute("userid").toString());
		
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = transFormat.format(date);
		
		AdminDao adao = sqlSession.getMapper(AdminDao.class);
		ArrayList<ReserveDto> list=adao.reserve_list();
		model.addAttribute("list", list);
		model.addAttribute("today", today);
		model.addAttribute("mdto", mdto);
		return "/admin/reserve_check";
	}
	
	@RequestMapping("/admin/mem_rejoin")
	public String mem_rejoin(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		mdao.mem_rejoin(id);
		return "redirect:/admin/member_list";
	}
	
	@RequestMapping("/admin/reserve_del")
	public String reserve_del(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		rdao.reserve_del(id);
		return "redirect:/admin/reserve_check";
	}
	
	
	
	
	
	
	
	
}
