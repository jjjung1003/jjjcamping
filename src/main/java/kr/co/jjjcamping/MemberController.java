package kr.co.jjjcamping;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jjjcamping.dao.MemberDao;
import kr.co.jjjcamping.dto.MemberDto;
import kr.co.jjjcamping.memcommand.Id_search_okCommand;
import kr.co.jjjcamping.memcommand.Login_okCommand;
import kr.co.jjjcamping.memcommand.Mail_SendCommand;

@Controller
public class MemberController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/main/index")
	public String index()
	{
		return "/main/index";
	}
	
	@RequestMapping("/member/mem_first")
	public String mem_first()
	{
		return "/member/mem_first";
	}
	
	@RequestMapping("/member/mem_second")
	public String mem_second(HttpServletRequest request,Model model)
	{
		model.addAttribute("cla1",request.getParameter("cla_fir"));
		model.addAttribute("cla2",request.getParameter("cla_sec"));
		model.addAttribute("cla3",request.getParameter("cla_thir"));
		model.addAttribute("cla4",request.getParameter("cla_four"));		
		return "/member/mem_second";
	}
	
	@RequestMapping("/member/userid_check")
	public void userid_check(PrintWriter out,HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int result=mdao.userid_check(userid);
		out.print(result);
	}
	
	@RequestMapping("/member/mem_third")
	public String mem_third(MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.mem_third(mdto);
		return "redirect:/login/login";
	}
	
	@RequestMapping("/login/login")
	public String login(HttpServletRequest request,Model model)
	{		
		model.addAttribute("chk", request.getParameter("chk"));
		return "/login/login";		
	}
	
	@RequestMapping("/login/login_ok")
	public String login_ok(MemberDto mdto,HttpSession session)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		Login_okCommand loc=new Login_okCommand();
		String url=loc.login_ok(mdto,session,mdao);
		return url;
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/index";
	}

	@RequestMapping("/login/id_search")
	public String id_search(HttpServletRequest request,Model model)
	{
		model.addAttribute("chk", request.getParameter("chk"));
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("userid", request.getParameter("userid"));
		return "/login/id_search";
	}
	 
	@RequestMapping("/login/id_search_ok")
	public String id_search_ok(MemberDto mdto,Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		Id_search_okCommand lsoc=new Id_search_okCommand();
		String url=lsoc.id_search_ok(mdto,model,mdao);
		return url;
	}
	
	@RequestMapping("/login/email_send")
	public String email_send()
	{
		return "/login/email_send";
	}
	
	@RequestMapping("/login/pwd_search")
	public String pwd_search(HttpServletRequest request,Model model)
	{
		model.addAttribute("mdto3", request.getParameter("mdto3"));
		model.addAttribute("chk", request.getParameter("chk"));
		return "/login/pwd_search";
	}
	
	@RequestMapping("/login/pwd_search_ok")
	public String pwd_search_ok(MemberDto mdto) throws Exception
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		Mail_SendCommand msc=new Mail_SendCommand();
		String url=msc.email_send(mdto,mdao);				
		return url;
	}
	
	@RequestMapping("/login/pwd_change")
	public String pwd_change(HttpServletRequest request,Model model)
	{
		model.addAttribute("email",request.getParameter("email"));
		return "/login/pwd_change";
	}
	
	@RequestMapping("/login/pwd_change2")
	public String pwd_change2(HttpServletRequest request,Model model)
	{
		model.addAttribute("id",request.getParameter("id"));
		return "/login/pwd_change2";
	}
	
	@RequestMapping("/login/pwd_change_ok")
	public String pwd_change_ok(MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String decode_email="";
		
		for(int i=0; i<mdto.getEmail().length(); i++)
		{
			decode_email=decode_email+(char)(mdto.getEmail().charAt(i)-1);
		}
		mdto.setEmail(decode_email);
		
		mdao.pwd_change_ok(mdto);
		return "redirect:/login/login";
	}
	
	@RequestMapping("/login/pwd_change2_ok")
	public String pwd_change2_ok(MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);		
		mdao.pwd_change2_ok(mdto);
		return "redirect:/login/login";
	}
	
	@RequestMapping("/login/mypage")
	public String mypage(Model model,HttpSession session)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto=mdao.mypage(session.getAttribute("userid").toString());		
		model.addAttribute("mdto", mdto);
		return "/login/mypage";
	}
	
	@RequestMapping("/login/mem_update")
	public String mem_update(HttpServletRequest request,Model model)
	{
		String id=request.getParameter("id");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto=mdao.mem_update(id);
		model.addAttribute("mdto", mdto);
		model.addAttribute("chk", request.getParameter("chk"));
		return "/login/mem_update";
	}
	
	@RequestMapping("login/mem_update_ok")
	public String mem_update_ok(HttpServletRequest request,MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String pwd=mdao.pwd_check(request.getParameter("id"));
		String id=request.getParameter("id");
		if(pwd.equals(mdto.getPwd()))
		{
			mdao.mem_update_ok(mdto);
			return "redirect:/login/mypage";
		}
		else
			return "redirect:/login/mem_update?id="+id+"&chk=1";
	}
	
	@RequestMapping("login/mem_del")
	public String mem_del(HttpServletRequest request,HttpSession session)
	{
		String id=request.getParameter("id");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.mem_del(id);
		session.invalidate();
		return "redirect:/main/index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
