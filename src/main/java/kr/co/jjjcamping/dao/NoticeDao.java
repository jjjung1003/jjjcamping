package kr.co.jjjcamping.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.co.jjjcamping.dto.NoticeDto;

public interface NoticeDao {

	public void write_ok(NoticeDto ndto);

	public ArrayList<NoticeDto> list(int index, String cla, String search);

	public NoticeDto content(String id);

	public void hit(String id);

	public NoticeDto update(String id);

	public void update_ok(NoticeDto ndto);

	public void delete(String id);

	public int list_cnt(String cla, String search);

	public String pwd_chk(String email);

	

}
