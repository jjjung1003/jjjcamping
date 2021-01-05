package kr.co.jjjcamping.memcommand;

import javax.servlet.http.HttpServletRequest;

import kr.co.jjjcamping.Mail_Send;
import kr.co.jjjcamping.dao.MemberDao;
import kr.co.jjjcamping.dto.MemberDto;

public class Mail_SendCommand {

	public String email_send(MemberDto mdto, MemberDao mdao) throws Exception
	{
		MemberDto mdto2=mdao.email_send(mdto);
		Mail_Send ms=Mail_Send.getInstance();
		String email=mdto.getEmail();
		String encode_email="";
		String url=null;		
		
		if(mdto2==null)
		{
			url="redirect:/login/pwd_search?chk=1";			
		}
		else
		{
			for(int i=0; i<email.length(); i++)
			{
				encode_email=encode_email+(char)(email.charAt(i)+1);
			}
			String subject="[캠핑] 비밀번호 재설정 관련 메일입니다.";
			String body="비밀번호 변경 링크 : http://localhost/kovea/login/pwd_change?email="+encode_email;
			ms.setEmail(email, subject, body);
			url="redirect:/login/pwd_search?chk=0";
		}
		return url;
		
	}

}
