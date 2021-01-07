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

import kr.co.jjjcamping.dao.StoreDao;
import kr.co.jjjcamping.dto.StoreDto;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	
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
	
	
	
	
	
	
	
	
	
	
	
	
}
