package kr.co.jjjcamping.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.jjjcamping.dao.MemberDao;
import kr.co.jjjcamping.dto.MemberDto;

public class Login_okCommand {

	/*public String login_ok(MemberDto mdto, HttpSession session, MemberDao mdao) {

		MemberDto mdto2=mdao.login_ok(mdto);
		
		String url=null;
		
		if(mdto2==null)
		{
			url="redirect:/login/login?chk=1";
		}
		else
		{
			session.setAttribute("email", mdto2.getEmail());
			session.setAttribute("userid", mdto2.getUserid());
			session.setAttribute("name", mdto2.getName());
			url="redirect:/main/index";
		}
		return url;
	}*/
	
	public String login_ok(MemberDto mdto, HttpSession session, HttpServletRequest request, MemberDao mdao, BCryptPasswordEncoder pwdEncoder) {
	MemberDto mdto2=mdao.login_ok(mdto);
	
	String userid=request.getParameter("userid");
	String dbpwd=mdao.pwd_check2(userid);
	String url="";
	
	if(!pwdEncoder.matches(request.getParameter("pwd"), dbpwd))
	{
		url="redirect:/login/login?chk=1";
	}
	else
	{
		session.setAttribute("email", mdto2.getEmail());
		session.setAttribute("userid", mdto2.getUserid());
		session.setAttribute("name", mdto2.getName());
		url="redirect:/main/index";
	}
	return url;
	}
}
