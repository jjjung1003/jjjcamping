package kr.co.jjjcamping.dao;

import javax.servlet.http.HttpServletRequest;

import kr.co.jjjcamping.dto.MemberDto;
import kr.co.jjjcamping.dto.ReserveDto;

public interface MemberDao {

	public int userid_check(String userid);
	public void mem_third(MemberDto mdto);
	public MemberDto login_ok(MemberDto mdto);
	public MemberDto id_search_ok(MemberDto mdto);
	public MemberDto id_search_ok2(MemberDto mdto);
	public MemberDto email_send(MemberDto mdto);
	public void pwd_change_ok(MemberDto mdto);
	public void pwd_change2_ok(MemberDto mdto);

	public MemberDto mypage(String userid);
	public MemberDto mem_update(String id);
	public void mem_update_ok(MemberDto mdto);
	public void mem_del(String id);
	
	public String pwd_check(String id);
	public String pwd_check2(String userid);
	
	public void mem_rejoin(String id);
	public void point_update(String point, String userid);
	
	
	
	
	

}
