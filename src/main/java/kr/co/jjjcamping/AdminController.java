package kr.co.jjjcamping;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jjjcamping.dao.CampDao;
import kr.co.jjjcamping.dao.StoreDao;
import kr.co.jjjcamping.dto.CampDto;
import kr.co.jjjcamping.dto.StoreDto;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/admin/admin_list")
	public String admin_list()
	{
		return "/admin/admin_list";
	}
	
	@RequestMapping("/admin/store_write")
	public String store_write()
	{
		return "/admin/store_write";
	}
	
	@RequestMapping("/admin/store_write_ok")
	public String store_write_ok(StoreDto sdto, HttpServletRequest request) throws IOException
	{
		StoreDao sdao=sqlSession.getMapper(StoreDao.class);
		
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
		
		sdao.store_write_ok(sdto);
		return "/admin/store_write_ok";
	}
	
	@RequestMapping("/admin/camp_write")
	public String camp_write()
	{
		return "/admin/camp_write";
	}
	
	@RequestMapping("/admin/camp_write_ok")
	public String camp_write_ok(CampDto cdto, HttpServletRequest request) throws IOException
	{
		CampDao cdao=sqlSession.getMapper(CampDao.class);
		
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
		
		cdao.camp_write_ok(cdto);
		return "redirect:/admin/admin_list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
