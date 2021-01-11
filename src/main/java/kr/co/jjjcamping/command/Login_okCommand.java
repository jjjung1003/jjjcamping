package kr.co.jjjcamping.command;

import javax.servlet.http.HttpSession;

import kr.co.jjjcamping.dao.MemberDao;
import kr.co.jjjcamping.dto.MemberDto;

public class Login_okCommand {

	public String login_ok(MemberDto mdto, HttpSession session, MemberDao mdao) {

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
	}

}
